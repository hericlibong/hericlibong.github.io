---
layout: post
title: "Heatmap des points par Grand Prix"
subtitle: "Récap de la saison de formule 2025"
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1768164591/image-10_ibrd7v.jpg"
tags: [dataviz, F1, D3.js, python]
author: Héric Libong
---

Cette visualisation propose une lecture synthétique de la saison 2025 de Formule 1 à travers les **points marqués course après course**.

## Une saison de Formule 1 en D3.js

Plutôt que de s’arrêter au classement final, elle permet d’observer **comment le championnat se construit dans le temps**, Grand Prix après Grand Prix.

Chaque colonne correspond à une course du calendrier, chaque ligne à un pilote, classé selon son total de points cumulés sur la saison. La couleur indique le nombre de points marqués lors de chaque épreuve, selon le barème officiel de la Formule 1, avec l’intégration des formats Sprint lorsque ceux-ci sont présents.


---

## Pourquoi une heatmap

La heatmap est particulièrement adaptée à un championnat comme la Formule 1, qui repose sur une **structure répétitive** (les courses) et une **logique cumulative** (les points).
Elle permet de repérer rapidement des régularités, des ruptures ou des zones de forte intensité, sans nécessiter la lecture systématique de chiffres.

L’objectif n’est pas de comparer des valeurs exactes, mais de rendre visibles des **motifs** dans la saison : continuité, variations, densité des points au fil du calendrier.

---

## Choix techniques

La visualisation est réalisée avec **D3.js**, afin de conserver un contrôle fin sur :

* la mise en page,
* les interactions,
* la hiérarchie visuelle,
* et l’intégration éditoriale.

Ce choix permet d’adapter précisément le design aux besoins du récit, plutôt que de s’appuyer sur une solution clé en main.



<iframe
  src="https://hericlibong.github.io/beautifullF1/season_summary_heatmap/embed.html"
  width="130%"
  height="900"
  style="border:none; border-radius:12px;"
  loading="lazy">
</iframe>

---

## Les données utilisées

Les données sont issues d’un CSV enrichi, construit à partir de plusieurs sources ouvertes autour de la Formule 1, notamment :

* **FastF1** – pour les résultats, classements, points et métriques de course
  [https://docs.fastf1.dev/](https://docs.fastf1.dev/)
* **jolpi.ca (Ergast mirror)** – pour l’historique et la structure des Grands Prix
  [https://api.jolpi.ca/ergast/](https://api.jolpi.ca/ergast/)
* **OpenF1** – pour certaines métadonnées complémentaires (pilotes, équipes, visuels)
  [https://openf1.org/](https://openf1.org/)

Les informations affichées au survol (positions de départ et d’arrivée, cumul de points, moyennes, etc.) servent à contextualiser chaque cellule sans alourdir la lecture principale.






