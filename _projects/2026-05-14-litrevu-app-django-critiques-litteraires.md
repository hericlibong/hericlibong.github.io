---
layout: project
title: "LitRevu — App Django de critiques littéraires"
subtitle: "Une application web Django pour demander, publier et partager des critiques de livres et d'articles."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1778761922/litRevu_2_trm2hw.png"
tags: [django, python, web-app, sqlite, postgresql, docker, rest-api]
author: Héric Libong
date: "2026-05-14"
lang: fr
translation_key: project-litrevu
---

## Origine du projet

**LitRevu** est né dans le cadre d'un projet de formation, avec pour objectif de mettre en pratique le framework **Django** sur une application web complète et fonctionnelle. L'idée : construire une plateforme communautaire autour de la lecture, où chacun peut demander des recommandations ou partager son avis sur un livre ou un article.

Le besoin couvert est simple : permettre à des lecteurs de solliciter ou de proposer des critiques, de suivre d'autres utilisateurs et de retrouver dans un flux personnalisé toutes les publications pertinentes pour eux.

Au-delà du livrable, le projet est surtout un terrain d'exploration de Django de bout en bout : modèles relationnels, authentification, formulaires, vues fonctionnelles et basées sur les classes, templates, et organisation d'un projet structuré pour la maintenance et l'évolution.

## Présentation du projet

LitRevu propose trois cas d'usage principaux :

1. **Demander une critique** en publiant un billet à propos d'un livre ou d'un article.
2. **Publier une critique** en réponse à un billet, ou de façon indépendante sur une œuvre.
3. **Découvrir des lectures** via les publications des utilisateurs suivis.

### Fonctionnalités clés

- **Création de billets** : les utilisateurs peuvent créer des billets pour solliciter une critique d'un livre ou d'un article.
- **Publication de critiques** : possibilité de répondre à un billet existant ou de publier une critique en autonomie.
- **Gestion des abonnements** : chaque utilisateur peut suivre d'autres comptes pour intégrer leurs publications à son flux.
- **Flux personnalisé** : tableau de bord chronologique mêlant les billets et critiques des comptes suivis ainsi que les publications personnelles.

### Authentification et démo

Une base SQLite de démonstration est livrée avec le projet, avec un compte de test (`opc-user` / `demo`) qui permet d'explorer l'application sans configuration préalable.

## Stack technique

### Côté backend

- **Python 3.10+** et **Django** pour l'ensemble de l'application
- **SQLite** par défaut pour faciliter la prise en main, **PostgreSQL** prévu pour la production
- **Django REST Framework** (en cours d'intégration) pour exposer les profils via une API
- Authentification Django native, étendue par un modèle `Profile` (biographie, photo, site web)

### Côté front

- Templates Django (Jinja-like) avec héritage de layout
- HTML, CSS personnalisés, sans framework JavaScript lourd

### Infrastructure et qualité

- Fichier `.env` pour la configuration sensible (clé secrète, `DEBUG`, `ALLOWED_HOSTS`)
- **Docker** + `docker-compose` (en cours) pour orchestrer l'app Django et la base PostgreSQL
- **GitHub Actions** prévu pour automatiser les tests et le déploiement sur Render
- Tests unitaires et fonctionnels en cours d'écriture pour sécuriser les évolutions

## État du projet

**En cours de refactorisation.** La première version fonctionnelle couvre les cas d'usage cœur (billets, critiques, suivi, flux). Une feuille de route active est en place pour faire évoluer l'application :

- Migration de SQLite vers **PostgreSQL** en production
- **Profils utilisateurs enrichis** (biographie, photo, site web)
- **API RESTful** sur les profils via Django REST Framework, sécurisée par tokens
- **Conteneurisation Docker** complète
- **CI/CD GitHub Actions** vers Render
- Documentation API (DRF Spectacular / Swagger) et renforcement des tests

Le suivi détaillé des tâches est tenu sur le [GitHub Project associé](https://github.com/users/hericlibong/projects/4).

## Liens utiles

- **Code source** : [github.com/hericlibong/Web_Django_App_LitRevu](https://github.com/hericlibong/Web_Django_App_LitRevu)
- **Suivi du projet** : [GitHub Project #4](https://github.com/users/hericlibong/projects/4)
