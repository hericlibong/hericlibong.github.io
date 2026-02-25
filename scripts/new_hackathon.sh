#!/bin/bash

# Script pour créer un nouveau hackathon à partir d'un template
# Usage: ./scripts/new_hackathon.sh "Titre du hackathon"

if [ -z "$1" ]; then
    echo "Erreur: Vous devez fournir un titre pour le hackathon"
    echo "Usage: ./scripts/new_hackathon.sh Titre du hackathon"
    exit 1
fi

# Récupérer le titre et créer un slug
TITLE=$1
SLUG=$(echo "$TITLE" | iconv -t ascii//TRANSLIT | sed -r 's/[^a-zA-Z0-9]+/-/g' | sed -r 's/^-+|-+$//g' | tr A-Z a-z)
DATE=$(date +%Y-%m-%d)
FILENAME="_projects/hackathons/${DATE}-${SLUG}.md"

# Vérifier si le fichier existe déjà
if [ -f "$FILENAME" ]; then
    echo "Erreur: Le fichier $FILENAME existe déjà"
    exit 1
fi

# S'assurer que le répertoire existe
mkdir -p _projects/hackathons

# Créer le nouveau hackathon à partir du template
cp _templates/new_hackathon.md "$FILENAME"

# Remplacer les placeholders
sed -i "s/{{ title }}/${TITLE}/g" "$FILENAME"
sed -i "s/{{ content }}/

/" "$FILENAME"

echo "✅ Nouveau hackathon créé: $FILENAME"
echo "Vous pouvez maintenant éditer le fichier pour ajouter votre contenu."