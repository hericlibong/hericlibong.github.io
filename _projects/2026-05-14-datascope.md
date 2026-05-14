---
layout: project
title: "Datascope"
subtitle: "Un assistant pour révéler le potentiel data des articles journalistiques."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1778754295/Capture_d_%C3%A9cran_2026-05-14_122408_cyopp2.png"
tags: [journalisme, data, nlp, flask, python, spacy, openai, llm, datafication]
author: Héric Libong
date: "2026-05-14"
lang: fr
translation_key: project-datascope
---

## Origine du projet

**Datascope** est une application web conçue pour aider les journalistes à identifier le potentiel "data" d'un article. L'outil combine traitement du langage naturel (NLP) local et intelligence artificielle générative pour extraire les entités clés d'un texte, calculer un score de "datafication", suggérer des angles éditoriaux et proposer des sources de données ouvertes pertinentes.

L'objectif est d'offrir un assistant léger qui accompagne la phase d'enquête et d'idéation, en transformant un article brut en pistes exploitables pour du data journalisme.

🔗 **Application en ligne** : [datascope.onrender.com](https://datascope.onrender.com/)

## Fonctionnalités

- **Extraction d'entités** : repérage automatique des personnes, lieux, dates, nombres et organisations via NLP local
- **Score de datafication** : indicateur synthétique évaluant le potentiel data d'un article
- **Suggestions d'angles éditoriaux** : génération d'angles journalistiques alimentée par un LLM
- **Sources de données ouvertes** : propositions d'API ou de jeux de données pertinents à explorer
- **Support multilingue** : analyse d'articles en français et en anglais (sélection via interface)
- **Multi-format** : prise en charge de texte brut, PDF et documents Word
- **Export** : téléchargement de l'analyse en Markdown ou JSON

## Stack technique

### Backend et NLP

- **Python 3.12** et **Flask** pour l'application web
- **spaCy** pour le traitement local du langage (`fr_core_news_sm`, `en_core_web_sm`)
- **OpenAI API** pour la génération d'angles éditoriaux et de suggestions
- **pdfminer** et **python-docx** pour l'import multi-format

### Qualité et tests

- **pytest** pour les tests unitaires et d'intégration
- Couverture de tests supérieure à 80% (`pytest-cov`)
- **black** pour le formatage du code

### Déploiement

- Dockerisé via `Dockerfile` et `docker-compose.yml`
- Déployé en production sur **Render.com**
- Authentification simple par email

## Architecture

Le projet est organisé autour de modules clairement séparés :

- `app/` : routes Flask, vues et templates Jinja2
- `core/` : pipeline de traitement (NLP, appels LLM, parsing, exports)
- `tests_pytest/` : tests unitaires et d'intégration
- `uploads/` : stockage temporaire des articles soumis

Cette séparation permet de faire évoluer indépendamment la couche d'analyse (NLP + LLM) et l'interface web.

## État du projet

**Déployé et fonctionnel.** L'application est accessible en ligne et couvre les principaux cas d'usage : import multi-format, analyse bilingue, génération d'angles et export. Les pistes d'évolution portent sur l'enrichissement des sources de données ouvertes proposées et l'affinage du score de datafication.

## Liens utiles

- **Application en ligne** : [datascope.onrender.com](https://datascope.onrender.com/)
- **Code source** : [github.com/hericlibong/datascope_project](https://github.com/hericlibong/datascope_project)
