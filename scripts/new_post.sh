#!/bin/bash

# Script pour créer un nouvel article à partir d'un template
# Usage: ./scripts/new_post.sh "Titre de l'article"

if [ -z "$1" ]; then
    echo "Erreur: Vous devez fournir un titre pour l'article"
    echo "Usage: ./scripts/new_post.sh Titre de l'article"
    exit 1
fi

# Récupérer le titre et créer un slug
TITLE=$1
SLUG=$(echo "$TITLE" | iconv -t ascii//TRANSLIT | sed -r 's/[^a-zA-Z0-9]+/-/g' | sed -r 's/^-+|-+$//g' | tr A-Z a-z)
DATE=$(date +%Y-%m-%d)
FILENAME="_posts/${DATE}-${SLUG}.md"

# Vérifier si le fichier existe déjà
if [ -f "$FILENAME" ]; then
    echo "Erreur: Le fichier $FILENAME existe déjà"
    exit 1
fi

# Créer le nouveau post à partir du template
cp _templates/new_post.md "$FILENAME"

# Remplacer les placeholders
sed -i "s/{{ title }}/${TITLE}/g" "$FILENAME"
sed -i "s/{{ content }}/\n\n/" "$FILENAME"

echo "✅ Nouveau post créé: $FILENAME"
echo "Vous pouvez maintenant éditer le fichier pour ajouter votre contenu."
