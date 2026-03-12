#!/usr/bin/env python3
"""
Generate an English translation skeleton from an existing French post/project.

Usage:
  python scripts/generate_en_translation.py _posts/2026-01-03-heatmap-des-points-par-grand-prix.md
  python scripts/generate_en_translation.py _projects/2026-01-13-quand-la-culture-orale-rencontre-l-ia-living-archive.md
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path
from typing import Dict, Tuple


REPO_ROOT = Path(__file__).resolve().parent.parent
POSTS_DIR = REPO_ROOT / "_posts"
PROJECTS_DIR = REPO_ROOT / "_projects"


def parse_front_matter(content: str) -> Tuple[Dict[str, str], str]:
    if not content.startswith("---\n"):
        raise ValueError("Missing YAML front matter.")

    end = content.find("\n---\n", 4)
    if end == -1:
        raise ValueError("Malformed YAML front matter.")

    raw_front = content[4:end]
    body = content[end + 5 :]

    data: Dict[str, str] = {}
    for line in raw_front.splitlines():
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if line.startswith(" ") or line.startswith("\t"):
            # multiline/indented values are not needed by this workflow
            continue
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip()
    return data, body


def read_file(path: Path) -> Tuple[Dict[str, str], str]:
    text = path.read_text(encoding="utf-8")
    return parse_front_matter(text)


def build_slug_from_filename(src: Path) -> str:
    stem = src.stem
    stem = re.sub(r"^\d{4}-\d{2}-\d{2}-", "", stem)
    stem = re.sub(r"-en$", "", stem)
    slug = re.sub(r"[^a-zA-Z0-9-]+", "-", stem).strip("-").lower()
    return slug


def is_post(path: Path) -> bool:
    return POSTS_DIR in path.parents


def is_project(path: Path) -> bool:
    return PROJECTS_DIR in path.parents


def build_target_path(src: Path) -> Path:
    if src.stem.endswith("-en"):
        raise ValueError("Source file already looks like an English file (-en).")
    return src.with_name(f"{src.stem}-en{src.suffix}")


def build_permalink(src: Path, slug: str) -> str:
    if is_post(src):
        return f"/en/{slug}/"
    if is_project(src):
        return f"/en/projects/{slug}/"
    raise ValueError("Supported only for _posts and _projects files.")


def normalize_type_and_validate(src: Path) -> None:
    if not src.exists():
        raise ValueError(f"Source file not found: {src}")
    if src.suffix.lower() != ".md":
        raise ValueError("Source file must be a Markdown file (.md).")
    if not (is_post(src) or is_project(src)):
        raise ValueError("Source file must be inside _posts/ or _projects/.")


def find_duplicate_by_translation_key(
    src: Path, translation_key: str, source_target_path: Path
) -> Path | None:
    if is_post(src):
        files = POSTS_DIR.rglob("*.md")
    else:
        files = PROJECTS_DIR.rglob("*.md")

    for candidate in files:
        if candidate == source_target_path:
            continue
        try:
            front, _ = read_file(candidate)
        except Exception:
            continue
        if front.get("translation_key") == translation_key and front.get("lang", "").strip('"').strip("'") == "en":
            return candidate
    return None


def generate_translation_key(src: Path) -> str:
    slug = build_slug_from_filename(src)
    prefix = "post" if is_post(src) else "project"
    return f"{prefix}-{slug}"


def to_front_matter_text(front: Dict[str, str]) -> str:
    ordered = [
        "layout",
        "title",
        "subtitle",
        "feature-image",
        "tags",
        "author",
        "date",
        "category",
        "lang",
        "translation_key",
        "permalink",
    ]
    lines = ["---"]
    used = set()
    for key in ordered:
        if key in front:
            lines.append(f"{key}: {front[key]}")
            used.add(key)

    for key, value in front.items():
        if key not in used:
            lines.append(f"{key}: {value}")
    lines.append("---")
    return "\n".join(lines) + "\n"


def clean_lang_value(value: str) -> str:
    return value.strip().strip('"').strip("'")


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Generate EN translation skeleton from FR post/project."
    )
    parser.add_argument("source", help="Path to FR source Markdown file")
    parser.add_argument(
        "--dry-run", action="store_true", help="Preview result without writing files"
    )
    args = parser.parse_args()

    src = (REPO_ROOT / args.source).resolve() if not args.source.startswith("/") else Path(args.source).resolve()
    try:
        normalize_type_and_validate(src)
        front, body = read_file(src)
    except Exception as exc:
        print(f"❌ {exc}")
        return 1

    source_lang = clean_lang_value(front.get("lang", "fr"))
    if source_lang != "fr":
        print(f"❌ Source file must be French (lang: fr). Found lang: {source_lang}")
        return 1

    target = build_target_path(src)
    if target.exists():
        print(f"❌ EN file already exists: {target.relative_to(REPO_ROOT)}")
        return 1

    translation_key = front.get("translation_key", "").strip()
    if not translation_key:
        translation_key = generate_translation_key(src)

    duplicate = find_duplicate_by_translation_key(src, translation_key, target)
    if duplicate:
        print(
            "❌ EN translation already exists for this translation_key: "
            f"{duplicate.relative_to(REPO_ROOT)}"
        )
        return 1

    slug = build_slug_from_filename(src)
    front["lang"] = "en"
    front["translation_key"] = translation_key
    front["permalink"] = build_permalink(src, slug)

    final_front = to_front_matter_text(front)
    todo_block = (
        "\n> TODO(EN): Translate this content from French.\n"
        "> Keep structure and links aligned with the FR source.\n\n"
    )
    output = final_front + todo_block + body.lstrip("\n")

    rel_src = src.relative_to(REPO_ROOT)
    rel_target = target.relative_to(REPO_ROOT)
    if args.dry_run:
        print("🔎 Dry-run")
        print(f"Source : {rel_src}")
        print(f"Target : {rel_target}")
        print(f"lang=en, translation_key={translation_key}, permalink={front['permalink']}")
        return 0

    target.write_text(output, encoding="utf-8")
    print("✅ EN translation skeleton created")
    print(f"Source : {rel_src}")
    print(f"Target : {rel_target}")
    print(f"translation_key: {translation_key}")
    print(f"permalink: {front['permalink']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
