---
layout: post
title: "The 2025 Formula 1 season in a heatmap"
subtitle: "A race-by-race visual recap of the 2025 F1 season"
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1768164591/image-10_ibrd7v.jpg"
tags: [dataviz, F1, D3.js, python, heatmap]
author: Héric Libong
lang: en
translation_key: post-f1-heatmap-2025
permalink: /en/f1-2025-season-heatmap/
---

This visualization offers a compact reading of the 2025 Formula 1 season through **points scored race after race**.

## A Formula 1 season in D3.js

Rather than focusing only on final standings, it shows **how the championship evolves over time**, Grand Prix by Grand Prix.

Each column is one race, each row is one driver ranked by cumulative points. Color intensity reflects points scored in each event, including Sprint formats when available.

---

## Why a heatmap

A heatmap is well suited to Formula 1 because the championship is built on a **repetitive structure** (races) and a **cumulative logic** (points).

It helps identify patterns, disruptions, and intensity zones quickly, without reading raw numbers line by line.

---

## Technical choices

The visualization is built with **D3.js**, providing full control over:

* layout,
* interactions,
* visual hierarchy,
* and editorial integration.

<iframe
  src="https://hericlibong.github.io/beautifullF1/season_summary_heatmap/embed.html"
  width="130%"
  height="900"
  style="border:none; border-radius:12px;"
  loading="lazy">
</iframe>

---

## Data sources

The dataset is built from multiple open F1 sources:

* **FastF1** – results, standings, points, race metrics  
  [https://docs.fastf1.dev/](https://docs.fastf1.dev/)
* **jolpi.ca (Ergast mirror)** – historical race structure  
  [https://api.jolpi.ca/ergast/](https://api.jolpi.ca/ergast/)
* **OpenF1** – supplemental metadata (drivers, teams, visuals)  
  [https://openf1.org/](https://openf1.org/)
