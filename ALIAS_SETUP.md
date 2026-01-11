# Configuration des alias pour le projet Jekyll

Ce document explique comment configurer les alias pour simplifier les commandes courantes.

## Méthode 1 : Utilisation du script setup_aliases.sh (recommandé)

### Activation temporaire (pour la session actuelle)

1. Depuis le répertoire du projet, exécutez :
```bash
source setup_aliases.sh
```

2. Les alias suivants seront disponibles :
- `new_article "Titre"` : Créer un nouvel article
- `jekyll_serve` : Lancer le serveur local

### Activation permanente

1. Ajoutez cette ligne à la fin de votre `~/.bashrc` :
```bash
source /home/hericdev/STATIC_PROJECT/hericlibong.github.io/setup_aliases.sh
```

2. Rechargez votre configuration :
```bash
source ~/.bashrc
```

## Méthode 2 : Configuration manuelle des alias

### Option A : Ajouter directement à votre .bashrc

1. Ouvrez votre `~/.bashrc` :
```bash
nano ~/.bashrc
```

2. Ajoutez ces lignes à la fin :
```bash
# Alias pour le projet Jekyll
alias new_article='/home/hericdev/STATIC_PROJECT/hericlibong.github.io/scripts/new_article'
alias jekyll_serve='cd /home/hericdev/STATIC_PROJECT/hericlibong.github.io && bundle exec jekyll serve --livereload'
```

3. Sauvegardez et rechargez :
```bash
source ~/.bashrc
```

### Option B : Créer un fichier .bash_aliases

1. Créez le fichier :
```bash
touch ~/.bash_aliases
```

2. Ajoutez les alias :
```bash
echo "# Alias pour le projet Jekyll" >> ~/.bash_aliases
echo "alias new_article='/home/hericdev/STATIC_PROJECT/hericlibong.github.io/scripts/new_article'" >> ~/.bash_aliases
echo "alias jekyll_serve='cd /home/hericdev/STATIC_PROJECT/hericlibong.github.io && bundle exec jekyll serve --livereload'" >> ~/.bash_aliases
```

3. Rechargez :
```bash
source ~/.bashrc
```

## Utilisation

Une fois configuré, vous pouvez utiliser :

```bash
# Créer un nouvel article
new_article "Mon super article"

# Lancer le serveur
jekyll_serve
```

## Dépannage

Si les alias ne fonctionnent pas :

1. Vérifiez que le script est exécutable :
```bash
chmod +x /home/hericdev/STATIC_PROJECT/hericlibong.github.io/scripts/new_article
```

2. Vérifiez que vous avez bien rechargé votre configuration :
```bash
source ~/.bashrc
```

3. Vérifiez les alias actifs :
```bash
alias | grep new_article
```

4. Si vous utilisez un environnement virtuel, assurez-vous qu'il n'interfère pas avec les alias.