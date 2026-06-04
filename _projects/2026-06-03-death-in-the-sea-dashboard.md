---
layout: project
title: "Death in the Sea - Dashboard"
subtitle: "Une cartographie interactive des morts et disparitions de personnes migrantes en Méditerranée depuis 2014."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1780576676/Capture_d_%C3%A9cran_du_2026-06-04_14-37-32_hkxyei.png"
tags: [data-visualisation, dashboard, cartographie, migration, méditerranée, d3js, mapbox, vite, github-pages]
author: Héric Libong
date: "2026-06-03"
lang: fr
translation_key: project-death-in-the-sea-dashboard
permalink: /projects/death-in-the-sea/
---

## Présentation

**Death in the Sea** est un tableau de bord interactif consacré aux morts et disparitions de personnes migrantes en Méditerranée. Il s'appuie sur les données ouvertes du **Missing Migrants Project** de l'OIM et propose une lecture cartographique des incidents documentés depuis 2014.

Le projet met l'accent sur une approche sobre : visualiser l'ampleur du phénomène sans gamification, conserver une lisibilité cartographique, et signaler les limites de précision des données.

<p>
  <a class="btn btn-primary" href="/projects/death-in-the-sea/dashboard/" target="_blank" rel="noopener">
    Ouvrir le dashboard en plein écran
  </a>
</p>

<iframe
  src="/projects/death-in-the-sea/dashboard/"
  title="Dashboard Death in the Sea"
  style="width: 100%; min-height: 820px; border: 1px solid #ddd; border-radius: 4px;"
  loading="lazy">
</iframe>

## Ce que montre le dashboard

- Une carte interactive des incidents documentés sur les routes méditerranéennes centrale, occidentale et orientale.
- Des filtres par route migratoire.
- Une frise temporelle rétractable pour explorer les victimes par année.
- Des compteurs dynamiques pour suivre le nombre d'incidents et de victimes dans la sélection active.
- Une signalisation visuelle des localisations imprécises et des coordonnées corrigées éditorialement.

## Stack technique

Le dashboard est construit avec **Vite**, **JavaScript vanilla**, **Mapbox GL JS** et **D3**. Les données sont embarquées sous forme de GeoJSON statique, ce qui permet une publication directe sur GitHub Pages sans backend.

## Données et limites

Les chiffres affichés sont des **estimations minimales**. Les pertes réelles sont vraisemblablement plus élevées, et la couverture institutionnelle ou médiatique des morts en migration reste inégale selon les zones et les périodes.

Source : **IOM Missing Migrants Project**. Le jeu de données intégré couvre les incidents méditerranéens enregistrés entre janvier 2014 et mai 2026, à partir d'un instantané du 19 mai 2026.

## Statut

Prototype éditorial publié en version statique. Les prochaines évolutions possibles portent sur la documentation méthodologique, l'ajout d'une version anglaise et l'optimisation du poids du bundle cartographique.
