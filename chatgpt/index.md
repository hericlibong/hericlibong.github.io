# Chatgpt



Voici comment procéder pour réaliser cette requête avec Overpass Turbo :

Accédez à la plateforme Overpass Turbo à l'adresse suivante : https://overpass-turbo.eu/.

Saisissez la requête suivante dans la zone de texte située en haut de la page :


```overpass QL

[out:json][timeout:25];
(
  node["amenity"="restaurant"](around:10000,14.69699,-17.44386);
  node["amenity"="bar"](around:10000,14.69699,-17.44386);
  node["amenity"="nightclub"](around:10000,14.69699,-17.44386);
);
out body;
>;
out skel qt;

```

Cliquez sur le bouton "Exécuter" pour lancer la requête.
Cette requête va rechercher les nœuds (points) situés dans un rayon de 10 000 mètres autour des coordonnées géographiques (14.69699,-17.44386), qui correspondent à la ville de Dakar au Sénégal. Ces nœuds doivent être des restaurants, des bars ou des boîtes de nuit, selon l'étiquette "amenity" qui leur est associée.

Le résultat de la requête sera affiché sur la carte et dans la fenêtre de données située à droite. Vous pourrez alors naviguer sur la carte pour explorer les résultats, et cliquer sur chaque nœud pour afficher ses détails.

