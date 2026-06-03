# Jeu de donnees de reference

Ce dossier contient le jeu de donnees de reference pour reconstruire la dataviz a partir des faits documentes, du debut connu de l'epidemie jusqu'au 28 mai 2026.

## Fichiers

- `labels.csv` : vocabulaire controle pour types d'evenements, flux, sources, statuts, couches et groupes de timeline.
- `places.csv` : lieux et entites cartographiques ou non cartographiques.
- `sources.csv` : sources utilisees ou citees.
- `events.csv` : chronologie evenementielle sourcee et qualifiee.
- `flows.csv` : relations geographiques, flux et corridors.
- `counts.csv` : bilans chiffres par date et entite.

## Principe

Le fichier central est `events.csv`.

Chaque ligne doit pouvoir repondre a :

- quand ?
- ou ?
- que s'est-il passe ?
- quelle source ?
- quel niveau de confiance ?
- quel statut editorial ?
- comment l'afficher sur une timeline ou une carte ?

## Prudence

- Les champs vides ne signifient pas zero.
- Les lignes `drc_total` et `uganda_total` sont des entites non cartographiques.
- Les flux ne prouvent pas automatiquement une transmission.
- Les chiffres du 25 au 28 mai restent instables et doivent etre affiches avec source et horodatage.
- Les coordonnees de zones de sante sont des proxies, pas des localisations operationnelles exactes.
