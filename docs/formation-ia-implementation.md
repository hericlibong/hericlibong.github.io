# Rapport d'implémentation — Rubrique "Formation IA"

> Site : hericlibong.github.io — Jekyll / Beautiful Jekyll
> Date de création : 20–21 avril 2026
> Commits : `c10dea3` · `e11e482` · `01ae0e0`

---

## 1. Objectif

Ajouter au portfolio bilingue FR/EN une nouvelle rubrique **"Formation IA"** présentant des modules pédagogiques liés à l'intelligence artificielle, avec :
- une page d'index FR (`/formation-ia/`) et son miroir EN (`/en/ai-training/`)
- une navbar bilingue
- une fiche détail par module (layout `project` existant)
- un bilinguisme complet dès la conception (`lang` + `translation_key` + bascule FR↔EN)

---

## 2. Architecture choisie

**Option retenue : nouvelle collection Jekyll `_formation_ia/`**, calquée sur le pattern de la collection `_projects/` existante.

| Critère | Choix |
|---|---|
| Type de contenu | Collection Jekyll dédiée |
| Répertoire source | `_formation_ia/` |
| URL FR (index) | `/formation-ia/` |
| URL EN (index) | `/en/ai-training/` (slug traduit — rupture volontaire) |
| URL FR (module) | `/formation-ia/<date-slug>/` (auto via permalink collection) |
| URL EN (module) | `/en/ai-training/<slug>/` (permalink explicite dans le front-matter) |
| Layout index | `home` (même que `/projects/`) |
| Layout détail | `project` (réutilisation sans modification) |
| Tri | Par date descendante |

---

## 3. Fichiers créés

### 3.1 Pages d'index

| Fichier | Rôle |
|---|---|
| `formation-ia.md` | Index FR — itère sur `site.formation_ia | where: "lang", "fr"` |
| `en/ai-training.md` | Index EN — itère sur `site.formation_ia | where: "lang", "en"` |

**Front-matter type (index FR) :**
```yaml
---
layout: home
title: Formation IA
permalink: /formation-ia/
lang: fr
translation_key: formation-ia-index
---
```

### 3.2 Modules de démonstration

| Fichier | Langue | Date | Titre |
|---|---|---|---|
| `_formation_ia/2026-04-10-introduction-aux-llm.md` | FR | 2026-04-10 | Introduction aux grands modèles de langage (LLM) |
| `_formation_ia/2026-04-10-introduction-aux-llm-en.md` | EN | 2026-04-10 | Introduction to Large Language Models (LLMs) |
| `_formation_ia/2026-03-05-prompt-engineering-methodes-et-pieges.md` | FR | 2026-03-05 | Prompt engineering : méthodes et pièges à éviter |
| `_formation_ia/2026-03-05-prompt-engineering-methodes-et-pieges-en.md` | EN | 2026-03-05 | Prompt Engineering: Methods and Pitfalls to Avoid |

---

## 4. Fichiers modifiés

### 4.1 `_config.yml`

**Déclaration de la collection** :
```yaml
collections:
  formation_ia:
    output: true
    permalink: /formation-ia/:path/
```

**Default front-matter** (appliqué automatiquement à tout fichier `_formation_ia/`) :
```yaml
defaults:
  - scope:
      path: ""
      type: "formation_ia"
    values:
      layout: "project"
      lang: "fr"
      feature-image: ""
```

### 4.2 `_data/navigation.yml`

Ajout de "Formation IA" (FR) et "AI Training" (EN) avant "BeautifullF1" dans les deux blocs de navigation :

```yaml
fr:
  - label: "Articles"
    url: "/articles/"
  - label: "Formation IA"          # ← ajouté
    url: "/formation-ia/"
  - label: "BeautifullF1"
    ...

en:
  - label: "Articles"
    url: "/en/articles/"
  - label: "AI Training"           # ← ajouté
    url: "/en/ai-training/"
  - label: "BeautifullF1"
    ...
```

### 4.3 `_data/site_text.yml`

Ajout de 3 clés i18n sous `fr.ui` et `en.ui` :

```yaml
fr:
  ui:
    formation_ia_title: "Formation IA"
    formation_ia_subtitle: "Modules et ressources pour apprendre l'IA"
    formation_ia_empty: "Aucun module publié pour l'instant."

en:
  ui:
    formation_ia_title: "AI Training"
    formation_ia_subtitle: "Modules and resources to learn AI"
    formation_ia_empty: "No module published yet."
```

### 4.4 `_includes/nav.html`

Ajout d'un 4e fallback dans la logique de bascule de langue, afin que le switcher FR↔EN fonctionne depuis les **fiches modules** (items de collection) :

```liquid
{% if translated_page == nil %}
  {% assign translated_page = site.formation_ia
     | where: "translation_key", page.translation_key
     | where: "lang", target_lang | first %}
{% endif %}
```

Sans ce fallback, la bascule depuis une fiche module tombait silencieusement sur la racine EN (`/en/`).

### 4.5 `_layouts/home.html`

Deux ajouts chirurgicaux pour brancher la collection dans le moteur d'affichage du layout :

**1. Skip du `{{ content }}` de la page** (éviter le doublon de grille) :
```liquid
{% unless page.permalink contains '/articles/'
       or page.permalink contains '/projects/'
       or page.permalink contains '/formation-ia/'   ← ajouté
       or page.permalink contains '/ai-training/' %} ← ajouté
  {{ content }}
{% endunless %}
```

**2. Branche `elsif` dans le calcul de `display_content`** :
```liquid
{% elsif page.permalink contains '/formation-ia/'
      or page.permalink contains '/ai-training/' %}
  {% assign display_content = site.formation_ia
     | where: "lang", current_lang | sort: 'date' | reverse %}
```

> **Contexte du bug :** Le layout `home.html` possède un `else` final qui concatène `site.posts + site.projects` pour tout permalink non reconnu. Sans cette branche dédiée, `/formation-ia/` affichait ses 2 modules + 6 items parasites (projets et articles d'autres rubriques).

---

## 5. Schéma de front-matter d'un module

### Module FR

```yaml
---
layout: project
title: "Titre du module en français"
subtitle: "Sous-titre ou accroche courte"
feature-image: "/assets/img/formation/nom-image.jpg"   # ou URL Cloudinary
tags: [Tag1, Tag2, Niveau]
author: Héric Libong
date: "YYYY-MM-DD"
lang: fr
translation_key: formation-ia-<slug-unique>
---
```

### Module EN (miroir)

```yaml
---
layout: project
title: "Module title in English"
subtitle: "Short subtitle or hook"
feature-image: "/assets/img/formation/nom-image.jpg"   # même image
tags: [Tag1, Tag2, Level]
author: Héric Libong
date: "YYYY-MM-DD"
lang: en
translation_key: formation-ia-<slug-unique>            # identique au FR
permalink: /en/ai-training/<slug-en>/                  # obligatoire côté EN
---
```

> `feature-image` est désormais injecté automatiquement via les defaults Jekyll (`_config.yml`). Il reste vide par défaut et est surchargé par la valeur du front-matter si elle est renseignée.

### Conventions de nommage des fichiers

| Version | Pattern | Exemple |
|---|---|---|
| FR | `YYYY-MM-DD-<slug-fr>.md` | `2026-04-10-introduction-aux-llm.md` |
| EN | `YYYY-MM-DD-<slug-fr>-en.md` | `2026-04-10-introduction-aux-llm-en.md` |

Le `translation_key` doit être identique dans les deux fichiers.

---

## 6. Mécanique bilingue

### Bascule de langue

La bascule est gérée par `_includes/nav.html` via `translation_key` :

1. **Index** (`formation-ia.md` ↔ `en/ai-training.md`) : les deux pages vivent dans `site.pages`, le lookup via `translation_key: formation-ia-index` fonctionne sans ajout.
2. **Fiches modules** : les items de collection ne sont pas dans `site.pages`. Le fallback ajouté à `nav.html` cherche dans `site.formation_ia` pour assurer la bascule FR↔EN depuis une fiche module.

### Permalinks EN

La collection déclare un seul permalink : `/formation-ia/:path/`. Pour que les modules EN aient une URL `/en/ai-training/<slug>/`, chaque fichier EN porte un `permalink:` explicite dans son front-matter (même mécanique que `_projects/` EN).

---

## 7. Ce qui est hors-scope (reporté volontairement)

| Fonctionnalité | Motif du report |
|---|---|
| Sous-catégories (débutant / avancé…) | Pas de contenu suffisant pour le justifier |
| Champ `order:` pour tri pédagogique | Tri par date suffisant pour l'instant |
| Champ `status: draft / published` | La convention existante (`_projects/`) n'en utilise pas ; `published: false` Jekyll suffit si besoin |
| Layout dédié `formation.html` | `project.html` suffit pour les besoins actuels |
| Extension du script `generate_en_translation.py` | À faire quand le volume de modules le justifiera |

---

## 8. URLs de production

| Page | FR | EN |
|---|---|---|
| Index | `/formation-ia/` | `/en/ai-training/` |
| Fiche "Intro aux LLM" | `/formation-ia/2026-04-10-introduction-aux-llm/` | `/en/ai-training/intro-llm/` |
| Fiche "Prompt Engineering" | `/formation-ia/2026-03-05-prompt-engineering-methodes-et-pieges/` | `/en/ai-training/prompt-engineering-methods/` |

---

## 9. Vérification

```bash
bundle exec jekyll serve
```

| Vérification | Attendu |
|---|---|
| `/formation-ia/` | 2 cartes modules, sidebar profil, navbar avec "Formation IA" |
| `/en/ai-training/` | 2 cartes EN, sidebar profil, navbar avec "AI Training" |
| Bascule `/formation-ia/` → | `/en/ai-training/` |
| Bascule depuis fiche module FR → | fiche EN correspondante |
| `/projects/`, `/articles/`, `/beautifullf1/` | Aucune régression |
| `/feed.xml` | Ne contient pas les modules formation (collection ≠ posts) |
