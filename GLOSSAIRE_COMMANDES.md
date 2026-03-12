# Glossaire des Commandes Essentielles

Ce document répertorie les commandes essentielles pour travailler avec le projet Jekyll.

## Table des Matières
- [Création d'articles](#création-darticles)
- [Création de projets](#création-de-projets)
- [Traduction FR → EN (semi-automatique)](#traduction-fr--en-semi-automatique)
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

## Création de projets et hackathons

### Créer un nouveau projet (méthode directe)
```bash
./scripts/new_project.sh "Titre de votre projet"
```

### Créer un nouveau hackathon (méthode directe)
```bash
./scripts/new_hackathon.sh "Titre du hackathon"
```

### Créer via les alias
```bash
# Configuration préalable des alias
source setup_aliases.sh

# Création du projet
new_project "Titre de votre projet"

# Création du hackathon
new_hackathon "Titre du hackathon"
```

## Traduction FR → EN (semi-automatique)

### Générer le squelette EN depuis un article FR
```bash
python scripts/generate_en_translation.py _posts/AAAA-MM-JJ-titre-fr.md
```

### Générer le squelette EN depuis un projet FR
```bash
python scripts/generate_en_translation.py _projects/AAAA-MM-JJ-titre-fr.md
```

### Vérifier sans écrire de fichier (dry-run)
```bash
python scripts/generate_en_translation.py _posts/AAAA-MM-JJ-titre-fr.md --dry-run
```

### Ce que fait la commande
- crée le fichier EN correspondant dans le bon dossier (`_posts` ou `_projects`)
- conserve les métadonnées utiles
- force `lang: en`
- conserve/génère `translation_key`
- génère un `permalink` sous `/en/...`
- bloque si une traduction EN existe déjà (doublon fichier ou `translation_key`)

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

## Liste des alias disponibles

- `new_article "Titre"` : Créer un nouvel article
- `new_project "Titre"` : Créer un nouveau projet
- `jekyll_serve` : Lancer le serveur local avec rechargement automatique

## Structure du projet

- `_posts/` : Contient tous les articles
- `_projects/` : Contient tous les projets
- `_templates/` : Contient les templates pour les nouveaux articles et projets
- `scripts/` : Contient les scripts utilitaires
- `setup_aliases.sh` : Script pour configurer les alias

## Bonnes pratiques

1. Toujours vérifier que le serveur est en cours d'exécution avant de créer un nouvel article
2. Utiliser les alias pour gagner du temps
3. Vérifier régulièrement la syntaxe avec `jekyll doctor`
4. Nettoyer le cache si des problèmes de génération surviennent
