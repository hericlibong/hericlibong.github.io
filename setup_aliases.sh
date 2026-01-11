#!/bin/bash

# Script pour configurer les alias pour le projet Jekyll
# Ce script peut être sourcé pour activer les alias dans la session actuelle

# Alias pour créer un nouvel article
new_article() {
    local title="$*"
    if [ -z "$title" ]; then
        echo "Erreur: Vous devez fournir un titre pour l'article"
        echo "Usage: new_article Titre de l'article"
        return 1
    fi
    
    # Chemin vers le script new_post.sh
    local script_path="$(dirname "${BASH_SOURCE[0]}")/scripts/new_post.sh"
    
    # Vérifier si le script existe
    if [ ! -f "$script_path" ]; then
        echo "Erreur: Le script $script_path n'existe pas"
        return 1
    fi
    
    # Exécuter le script avec le titre fourni
    "$script_path" "$title"
}

# Alias pour lancer le serveur Jekyll
jekyll_serve() {
    bundle exec jekyll serve --livereload
}

echo "✅ Alias configurés :"
echo "  - new_article "Titre" : Créer un nouvel article"
echo "  - jekyll_serve : Lancer le serveur local"
echo ""
echo "Pour activer ces alias dans votre session actuelle, exécutez :"
echo "  source setup_aliases.sh"