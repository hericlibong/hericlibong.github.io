#!/bin/bash

# Script pour créer un nouveau projet à partir d'un template
# Usage: ./scripts/new_project.sh "Titre du projet"

if [ -z "$1" ]; then
    echo "Erreur: Vous devez fournir un titre pour le projet"
    echo "Usage: ./scripts/new_project.sh Titre du projet"
    exit 1
fi

# Récupérer le titre et créer un slug
TITLE=$1
SLUG=$(echo "$TITLE" | iconv -t ascii//TRANSLIT | sed -r 's/[^a-zA-Z0-9]+/-/g' | sed -r 's/^-+|-+$//g' | tr A-Z a-z)
DATE=$(date +%Y-%m-%d)
FILENAME="_projects/${DATE}-${SLUG}.md"

# Vérifier si le fichier existe déjà
if [ -f "$FILENAME" ]; then
    echo "Erreur: Le fichier $FILENAME existe déjà"
    exit 1
fi

# Créer le nouveau projet à partir du template
cp _templates/new_project.md "$FILENAME"

# Remplacer les placeholders
sed -i "s/{{ title }}/${TITLE}/g" "$FILENAME"
sed -i "s/{{ content }}/

/" "$FILENAME"

echo "✅ Nouveau projet créé: $FILENAME"
echo "Vous pouvez maintenant éditer le fichier pour ajouter votre contenu."