---
layout: project
title: "Ebola Bundibugyo - Storymap"
subtitle: "Une dataviz interactive pour suivre l'alerte Ebola entre la RDC et l'Ouganda."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1780576241/Capture_d_%C3%A9cran_du_2026-06-04_14-22-47_eycdf8.png"
tags: [data-visualisation, storymap, cartographie, sante, ebola, d3js, typescript, vite, github-pages]
author: Héric Libong
date: "2026-06-03"
lang: fr
translation_key: project-ebola-bundibugyo-storymap
permalink: /projects/ebola-bundibugyo/
---

## Présentation

**Ebola Bundibugyo - Storymap** est une maquette de dataviz interactive consacrée à l'épisode documenté entre l'est de la République démocratique du Congo et l'Ouganda au printemps 2026.

Le projet combine une carte narrative, une timeline interactive, un panneau éditorial et un jeu de données de référence actualisable. L'objectif est de transformer une séquence sanitaire complexe en récit lisible : lieux cités, dates clés, signaux d'alerte, circulation transfrontalière et état des données disponibles.

<p>
  <a class="btn btn-primary" href="/projects/ebola-bundibugyo/dataviz/" target="_blank" rel="noopener">
    Ouvrir la dataviz interactive
  </a>
</p>

<iframe
  src="/projects/ebola-bundibugyo/dataviz/"
  title="Dataviz interactive Ebola Bundibugyo"
  style="width: 100%; min-height: 760px; border: 1px solid #ddd; border-radius: 4px;"
  loading="lazy">
</iframe>

## Ce que montre la visualisation

- Une carte centrée sur l'est de la RDC, l'Ouganda et les zones de passage documentées.
- Une timeline narrative du 24 avril au 28 mai 2026.
- Des événements classés par niveau de confiance et statut des données.
- Des tables de référence séparées pour les lieux, événements, flux, sources et décomptes.

## Stack technique

La dataviz est construite avec **Vite**, **TypeScript**, **D3** et une cartographie SVG statique alimentée par des données GeoJSON. Le projet est publié comme application statique sur GitHub Pages, sans backend dynamique.

## Statut

Il s'agit d'un prototype narratif V2 : une base exploitable pour tester la grammaire cartographique, la structure des données et l'expérience de lecture avant consolidation éditoriale finale.
