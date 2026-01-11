# Glossaire des Commandes Essentielles

Ce document répertorie les commandes essentielles pour travailler avec le projet Jekyll.

## Table des Matières
- [Création d'articles](#création-darticles)
- [Serveur local](#serveur-local)
- [Gestion du projet](#gestion-du-projet)
- [Autres commandes utiles](#autres-commandes-utiles)

## Création d'articles

### Créer un nouvel article (méthode directe)
```bash
./scripts/new_post.sh "Titre de votre article"
```

### Créer un nouvel article (via le wrapper)
```bash
./scripts/new_article "Titre de votre article"
```

### Créer un nouvel article (via l'alias)
```bash
# Configuration préalable des alias
source setup_aliases.sh

# Création de l'article
new_article "Titre de votre article"
```

## Serveur local

### Lancer le serveur Jekyll avec rechargement automatique
```bash
bundle exec jekyll serve --livereload
```

### Lancer le serveur via l'alias
```bash
# Configuration préalable des alias
source setup_aliases.sh

# Lancement du serveur
jekyll_serve
```

## Gestion du projet

### Installer les dépendances
```bash
bundle install
```

### Mettre à jour les dépendances
```bash
bundle update
```

### Vérifier la syntaxe du site
```bash
bundle exec jekyll doctor
```

## Autres commandes utiles

### Construire le site
```bash
bundle exec jekyll build
```

### Nettoyer le cache
```bash
bundle exec jekyll clean
```

### Lancer le serveur sur un port spécifique
```bash
bundle exec jekyll serve --port 4001
```

### Générer le site en production
```bash
JEKYLL_ENV=production bundle exec jekyll build
```

## Configuration des alias

Pour activer les alias dans votre session actuelle :
```bash
source setup_aliases.sh
```

Pour activer les alias automatiquement, ajoutez cette ligne à votre `.bashrc` ou `.zshrc` :
```bash
echo "source /chemin/vers/le/projet/setup_aliases.sh" >> ~/.bashrc
source ~/.bashrc
```

## Structure du projet

- `_posts/` : Contient tous les articles
- `_templates/` : Contient les templates pour les nouveaux articles
- `scripts/` : Contient les scripts utilitaires
- `setup_aliases.sh` : Script pour configurer les alias

## Bonnes pratiques

1. Toujours vérifier que le serveur est en cours d'exécution avant de créer un nouvel article
2. Utiliser les alias pour gagner du temps
3. Vérifier régulièrement la syntaxe avec `jekyll doctor`
4. Nettoyer le cache si des problèmes de génération surviennent