---
layout: project
title: "What Is This Duck For?"
subtitle: "Une application web absurde qui demande à une IA d'analyser un canard en plastique avec beaucoup trop de sérieux."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1780151841/escalate_ministry_duck_persona_auwpky.png"
tags: [ia, fastapi, python, gemini, javascript, jinja2, hackathon]
author: Héric Libong
date: "2026-05-30"
lang: fr
---

## Origine du projet

**What Is This Duck For?** est né d'un défi simple : construire une application volontairement inutile, mais suffisamment claire, cohérente et travaillée pour que l'inutilité devienne le sujet du projet.

Le point de départ est un objet trivial : un canard jaune en plastique. L'application le traite pourtant comme une affaire sérieuse, presque administrative, en demandant à une IA de produire des explications solennelles sur sa fonction supposée.

L'intérêt du projet n'est donc pas de résoudre un problème pratique. Il s'agit plutôt d'explorer un contraste : prendre un objet sans enjeu et lui appliquer les codes d'une enquête officielle, d'un rapport ministériel ou d'une analyse symbolique beaucoup trop confiante.

Le résultat fonctionne comme une petite expérience d'interface, d'écriture et de ton. Le canard reste au centre, mais chaque réponse transforme cette banalité en diagnostic pseudo-scientifique, mystique, bureaucratique ou franchement suspicieux.

## Présentation du projet

L'application propose une interface web courte et théâtrale : un canard central, un panneau de rapport, des libellés très formels et une ambiance visuelle inspirée des documents officiels.

L'utilisateur ne vient pas chercher une réponse utile. Il vient soumettre la même question fondamentale : **à quoi sert ce canard ?** L'IA répond alors selon un mode d'interprétation choisi.

### Cinq modes d'analyse

- **Analyze the Duck** : une lecture pseudo-scientifique de la fonction du canard
- **Request Deeper Interpretation** : une interprétation sur-intellectualisée et symbolique
- **Escalate to Ministry** : une réponse bureaucratique où le canard obtient une importance administrative ridicule
- **Trust the Duck** : une lecture mystique qui traite le canard comme une autorité silencieuse
- **Do Not Trust the Duck** : une interprétation paranoïaque qui refuse de croire à l'innocence du canard

Chaque mode produit un rapport court, structuré et absurdement sérieux. La contrainte d'écriture est importante : l'IA doit rester lisible, contrôlée et spécifique au mode choisi, sans partir dans du bruit générique.

![Escalate Ministry Duck Persona](https://res.cloudinary.com/dvlzgmjzb/image/upload/v1780151841/escalate_ministry_duck_persona_auwpky.png)

## Stack technique

### Backend et génération IA

- **Python** et **FastAPI** pour servir l'application web
- **Google Gemini API** pour générer les rapports absurdes
- Prompts séparés par persona pour garder un ton distinct selon le mode choisi
- Aucun compte utilisateur, aucune base de données, aucun tableau de bord

### Frontend

- **Jinja2** pour les templates HTML
- **HTML**, **CSS** et **JavaScript** vanilla pour l'interface
- Mise en scène visuelle centrée sur le canard et le panneau de rapport
- Architecture volontairement légère, adaptée à un projet court et démontrable

## État du projet

Le projet est un concept terminé : l'application FastAPI existe, l'interface principale est en place, les cinq modes d'analyse sont implémentés et la génération de rapports via Gemini est opérationnelle.

Il n'est pas pensé comme un produit à faire évoluer indéfiniment. Son intérêt tient justement à son périmètre serré : une idée absurde, une interface cohérente, une mécanique IA simple et un ton suffisamment sérieux pour que la blague fonctionne.

## Liens utiles

- **Code source GitHub** : [github.com/hericlibong/What_Is_This_Duck_For](https://github.com/hericlibong/What_Is_This_Duck_For)
