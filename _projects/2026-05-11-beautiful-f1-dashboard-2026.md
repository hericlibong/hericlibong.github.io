---
layout: project
title: "Beautiful F1 - Dashboard 2026"
subtitle: "Visualisation interactive de la saison Formule 1, alimentée par les données officielles FastF1."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1778496150/f1dashboard_yuoawi.png"
tags: [formule-1, data-visualisation, dashboard, fastf1, python, pandas, javascript, d3js, github-pages]
author: Héric Libong
date: "2026-05-11"
lang: fr
translation_key: project-beautiful-f1-dashboard-2026
---

## Origine du projet

**Beautiful F1** est un projet de data storytelling consacré à la Formule 1. Démarré comme une suite de visualisations indépendantes - la *Race Line* (évolution des points cumulés course par course) et la *Heatmap saisonnière* (vue d'ensemble points x pilotes x Grand Prix) -, il rassemble ces différents modules au sein d'un dashboard unifié.

L'objectif est de proposer une lecture cohérente de la saison en cours, dépassant la simple juxtaposition de graphiques pour offrir un véritable outil d'analyse : suivi du championnat, comparaisons entre pilotes, duels entre coéquipiers et exploration du calendrier.

## Sources de données

Toutes les données exploitées sont publiques et issues de sources officielles ou consolidées :

- **FastF1** : bibliothèque Python interfaçant les API officielles F1 (timing, résultats de sessions, tours de circuit, qualifications, sprints). Source principale, mise à jour automatiquement après chaque Grand Prix.
- **Wikidata** : données historiques par circuit (longueur, virages, fiches Wikipedia), via requêtes SPARQL.
- **Données curatées** : historique pluridécennal des Grands Prix (vainqueurs, podiums, champions du monde), maintenu sous forme de CSV enrichis.

L'ensemble du pipeline est reproductible : un seul script (`build_all.py`) orchestre la mise à jour complète après chaque course, de la collecte FastF1 au calcul des indicateurs, puis à la propagation vers le site publié.

## Présentation du dashboard

L'accueil est conçu pour tenir sur un seul écran, sans scroll superflu, et s'articule autour de quatre zones.

[![Aperçu du dashboard Beautiful F1](https://res.cloudinary.com/dvlzgmjzb/image/upload/v1778496835/dashboard_front1_rkddm5.png)](https://hericlibong.github.io/beautifullF1/)



### Bandeau d'indicateurs clés

- Leader actuel du championnat
- Écart entre les deux premiers
- Vainqueur du dernier Grand Prix
- Compte à rebours jusqu'à la prochaine course

### Vues principales

- **Pilotes** : classement complet avec rang, points, gain au dernier Grand Prix et écart au leader. Le top 10 est affiché par défaut, avec extension possible. Un clic sur une ligne ouvre une fiche pilote détaillée : photo, mini-sparkline d'évolution, tableau Grand Prix par Grand Prix.
- **Constructeurs** : classement des écuries, agrégeant les performances des deux pilotes de chaque équipe.
- **Calendrier** : les 22 Grands Prix de la saison, marqués par statut (joué, prochain, à venir) et week-end sprint, avec auto-positionnement sur la prochaine course.
- **Duel** : comparateur libre entre deux pilotes, avec points totaux, meilleur Grand Prix, head-to-head par course et évolution de l'écart cumulé.
- **Coéquipiers - Qualifs** : analyse des duels intra-écurie en qualification, référence officieuse pour évaluer un pilote indépendamment de sa monoplace. Le module inclut un sélecteur d'écurie, des filtres Quali / Sprint Quali / les deux, et une timeline horizontale où chaque point représente une session positionnée selon le gap exact au coéquipier.




### Modules complémentaires

La *Race Line* et la *Heatmap* restent accessibles depuis la navigation et via la carte "Visualisations". Elles constituent les deux premières briques du projet et continuent d'exister comme entrées autonomes dans l'exploration de la saison.

## Stack technique

### Côté données

- **fastf1 3.6** pour l'extraction des résultats, qualifications et données de télémétrie
- **pandas** pour la consolidation et les calculs d'indicateurs
- **pytest** pour les tests unitaires des builders

### Côté front

- HTML, CSS et JavaScript vanilla, sans framework
- **D3.js v7** pour les visualisations de la *Race Line* et de la *Heatmap*
- SVG inline composé directement en JavaScript pour les graphiques du dashboard (sparklines, timelines, mini line charts), afin de garder le bundle léger et l'empreinte minimale

### Hébergement et déploiement

- **GitHub Pages** : site servi depuis le dossier `docs/` du dépôt, accessible publiquement à [hericlibong.github.io/beautifullF1](https://hericlibong.github.io/beautifullF1/)
- Workflow de mise à jour manuel post-Grand Prix, calé sur le rythme du calendrier F1 (toutes les deux semaines en moyenne)

### Architecture

- Code source canonique dans `projects/<viz>/` (Python + sources HTML/JS/CSS)
- Scripts de synchronisation `sync_to_docs.py` pour recopier les artefacts publiables vers `docs/`
- Aucun backend dynamique : l'ensemble du dashboard fonctionne en site statique alimenté par des JSON pré-calculés

## État du projet

**En cours de développement, mais déjà bien avancé.** Le dashboard rassemble désormais les principaux modules d'analyse de la saison 2026 et l'architecture de mise à jour est en place. Les prochaines itérations porteront surtout sur le raffinement de l'expérience, la consolidation des données post-Grand Prix et l'enrichissement des vues comparatives.

## Liens utiles

- **Dashboard publié** : [hericlibong.github.io/beautifullF1](https://hericlibong.github.io/beautifullF1/)
- **Code source** : [github.com/hericlibong/beautifullF1](https://github.com/hericlibong/beautifullF1)
