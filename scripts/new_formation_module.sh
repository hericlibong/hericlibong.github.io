#!/bin/bash

# Script pour creer un nouveau mini-cours Formation IA a partir d'un template
# Usage: ./scripts/new_formation_module.sh "Titre du mini-cours"

if [ -z "$1" ]; then
    echo "Erreur: Vous devez fournir un titre pour le mini-cours"
    echo "Usage: ./scripts/new_formation_module.sh Titre du mini-cours"
    exit 1
fi

# Recuperer le titre et creer un slug
TITLE=$1
SLUG=$(echo "$TITLE" | iconv -t ascii//TRANSLIT | sed -r 's/[^a-zA-Z0-9]+/-/g' | sed -r 's/^-+|-+$//g' | tr A-Z a-z)
DATE=$(date +%Y-%m-%d)
DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S %z")
FILENAME="_formation_ia/${DATE}-${SLUG}.md"

# Verifier si le fichier existe deja
if [ -f "$FILENAME" ]; then
    echo "Erreur: Le fichier $FILENAME existe deja"
    exit 1
fi

# Creer le nouveau mini-cours a partir du template
cp _templates/new_formation_module.md "$FILENAME"

# Remplacer les placeholders
sed -i "s/{{ title }}/${TITLE}/g" "$FILENAME"
sed -i "s/{{ slug }}/${SLUG}/g" "$FILENAME"
sed -i "s/{{ date_slug }}/${DATE}/g" "$FILENAME"
sed -i "s/date: \"\"/date: \"${DATE_TIME}\"/g" "$FILENAME"

echo "Nouveau mini-cours Formation IA cree: $FILENAME"
echo "URL locale apres regeneration Jekyll : /formation-ia/mini-cours/${DATE}-${SLUG}/"
echo "Vous pouvez maintenant editer le fichier pour ajouter votre contenu."
