# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies (first time or after Gemfile changes)
bundle install

# Serve locally with live reload at http://localhost:4000
bundle exec jekyll serve --livereload

# Production build (output to _site/)
bundle exec jekyll build

# CI build (matches what GitHub Actions runs)
bundle exec appraisal jekyll build --future --config _config_ci.yml,_config.yml

# Create new content
./scripts/new_post.sh "Article Title"
./scripts/new_project.sh "Project Title"
./scripts/new_hackathon.sh "Hackathon Title"

# Generate English translation skeleton from a French file
python scripts/generate_en_translation.py _posts/YYYY-MM-DD-mon-article.md
```

Alternatively, source `setup_aliases.sh` to get `jekyll_serve`, `new_article`, `new_project`, `new_hackathon` shorthand aliases.

## Architecture

**Generator**: Jekyll with the [Beautiful Jekyll](https://beautifuljekyll.com/) theme (v6.0.1). The theme is loaded as a gem, so most layout/include overrides live in `_layouts/` and `_includes/` locally.

**Collections** (defined in `_config.yml`):
- `_posts/` — Blog articles, output at `/:year-:month-:day-:title/`
- `_projects/` — Project showcase, output at `/projects/:path/`
- `_formation_ia/` — AI training content, output at `/formation-ia/:path/`

**Bilingual (FR/EN) system**:
- Default language is French (`lang: fr` in `_config.yml`)
- Each piece of content has a paired `-en` variant with `lang: en`
- FR and EN files share a `translation_key` front matter field to link them
- FR permalinks use `/articles/`, EN permalinks use `/en/articles/`
- Navigation is duplicated in `_data/navigation.yml` under `fr:` and `en:` keys
- `scripts/generate_en_translation.py` auto-generates the EN skeleton (front matter + slug) from a FR source file

**Front matter conventions**:
```yaml
# French post
lang: fr
translation_key: my-article   # must match EN pair
permalink: /articles/my-article/

# English paired post
lang: en
translation_key: my-article
permalink: /en/articles/my-article/
```

**AI chat widget**: configured via `mistral_api_url` in `_config.yml`, proxied through a Cloudflare Worker. Widget markup lives in `_includes/ai_chat_widget.html`, JS in `assets/js/`.

**CI/CD**: `.github/workflows/ci.yml` — builds on Ubuntu with Ruby 3.3, uses `appraisal` for multi-version testing, uploads the `_site/` artifact to GitHub Pages. The `_config_ci.yml` overlay sets the correct `baseurl` for the Pages environment.

## Content Generation — Traduction EN (`_projects/` et `_posts/`)

Pour traduire une fiche projet ou un article du français vers l'anglais, procéder en **deux étapes** :

### 1. Générer la coquille EN

Lancer le script de génération sur le fichier FR source :

```bash
python scripts/generate_en_translation.py _posts/YYYY-MM-DD-mon-article.md
# ou
python scripts/generate_en_translation.py _projects/YYYY-MM-DD-mon-projet.md
```

Le script crée le fichier EN appairé (suffixe `-en`) avec :
- Le front matter pré-rempli (`lang: en`, `translation_key` identique au FR, `permalink` en `/en/...`)
- Le slug et le titre adaptés
- Le corps du fichier laissé tel quel (en français) pour servir de base à la traduction

### 2. Traduire le corps en anglais

Ouvrir le fichier EN généré et traduire **uniquement le corps Markdown** :

- **Respecter la structure narrative** du fichier FR : conserver l'ordre, les niveaux de titres (`##`, `###`), les listes, les images et les liens.
- **Adapter le ton pour un public anglophone** : éviter la traduction littérale, privilégier une formulation idiomatique et naturelle en anglais.
- **Ne pas modifier le front matter** : `title`, `subtitle`, `permalink`, `translation_key`, `lang`, `feature-image`, `tags`, `date` restent ceux générés par le script.
- **Ne pas modifier les URLs** (liens externes, images Cloudinary, ancres internes) : elles doivent rester strictement identiques à celles du fichier FR.
- Conserver les blocs de code, les emojis et les éléments de mise en forme à l'identique.
