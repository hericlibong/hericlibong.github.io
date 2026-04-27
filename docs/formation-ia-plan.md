# Plan de travail - Section Formation IA

Ce document sert de reference lisible pour suivre le travail sur la section
`/formation-ia/`. Il ne contient pas de front matter Jekyll, pas de Liquid, et
n'est pas destine a etre publie tel quel sur le site.

## Objectif

Transformer `/formation-ia/` en espace autonome, leger et specialise, tout en
restant integre au site Jekyll existant.

La section doit accueillir :

- une page d'accueil dediee ;
- une page Mini-cours ;
- une page Ressources ;
- une page Newsletter ;
- une page Participer ;
- un style visuel propre a la section.

On ne cree pas encore les vrais cours. On prepare une architecture claire pour
publier ensuite sans bricoler.

## Diagnostic du projet actuel

### Page `/formation-ia/`

La page actuelle est generee par le fichier :

`formation-ia.md`

Ce fichier contient :

- un front matter Jekyll ;
- du code Liquid ;
- du HTML ;
- un petit bloc de style inline.

C'est pour cela qu'il s'affiche mal dans l'apercu Markdown : ce n'est pas un
Markdown simple, mais une page Jekyll dynamique.

### Collection `_formation_ia`

Le dossier :

`_formation_ia/`

est une collection Jekyll declaree dans `_config.yml`.

Configuration actuelle :

```yml
collections:
  formation_ia:
    output: true
    permalink: /formation-ia/:path/
```

Cela signifie que les fichiers Markdown places dans `_formation_ia/` sont
publies sous des URLs du type :

`/formation-ia/nom-du-module/`

### Layouts utilises actuellement

Les fichiers importants sont :

- `_layouts/base.html` : socle global du site avec navbar, footer, scripts et chatbot ;
- `_layouts/home.html` : layout utilise actuellement par `formation-ia.md` ;
- `_layouts/project.html` : layout par defaut des contenus de `_formation_ia` ;
- `_layouts/post.html` : rendu reel des modules, car `project.html` herite de `post.html`.

Actuellement, la section Formation IA reutilise donc beaucoup la logique du
portfolio et des articles.

### Includes concernes

Les includes importants sont :

- `_includes/nav.html` : navigation principale du site ;
- `_includes/head.html` : chargement des CSS, dont les CSS declares par page ;
- `_includes/project_preview.html` : cartes actuellement utilisees pour afficher les modules ;
- `_includes/ai_chat_widget.html` : chatbot injecte globalement sur le site.

### CSS et JS

Il n'existe pas encore de CSS dedie a Formation IA.

Les fichiers globaux actuels sont dans :

- `assets/css/`
- `assets/js/`

Le fichier `_includes/head.html` permet deja de charger un CSS specifique via
le front matter d'une page :

```yml
css:
  - /assets/css/formation-ia.css
```

On peut donc ajouter un CSS dedie sans modifier le theme global.

### Navigation

La navigation principale est geree dans :

`_data/navigation.yml`

Le lien vers Formation IA existe deja cote francais :

`/formation-ia/`

Il existe aussi une entree anglaise :

`/en/ai-training/`

## Plan executable

Statuts :

- `[x]` valide ;
- `[~]` realise, en attente de verification navigateur ;
- `[ ]` a faire.

| Statut | Ordre | Fichier | Objectif | Modification prevue | Risque | Validation |
| --- | ---: | --- | --- | --- | --- | --- |
| [x] | 1 | `_layouts/formation_ia.html` | Creer un layout autonome | Ajouter un layout dedie avec header Formation IA, navigation interne et zone de contenu | Conflit visuel si CSS trop global | La section a une identite distincte sans casser navbar/footer |
| [x] | 2 | `assets/css/formation-ia.css` | Ajouter le style dedie | Creer des classes prefixees `.formation-ia-*`, cartes, hero, boutons, responsive | Fuite CSS vers le reste du site | Les pages Articles/Projets restent inchangees |
| [x] | 3 | `formation-ia.md` | Transformer l'accueil | Remplacer la liste automatique par une vraie page d'accueil Formation IA | La liste directe des modules disparait de l'accueil | `/formation-ia/` affiche la nouvelle entree de section |
| [x] | 4 | `formation-ia/mini-cours.md` | Creer la page Mini-cours | Ajouter 4 cartes de mini-cours "a venir" | Peu de risque | `/formation-ia/mini-cours/` est accessible |
| [x] | 5 | `formation-ia/ressources.md` | Creer la page Ressources | Ajouter des cartes pour prompts, fiches, checklists, exemples | Page encore placeholder | `/formation-ia/ressources/` est accessible |
| [x] | 6 | `formation-ia/newsletter.md` | Creer la page Newsletter | Ajouter une presentation et un bouton "Inscription a venir" | Bouton a ne pas connecter pour l'instant | Aucun outil externe n'est appele |
| [x] | 7 | `formation-ia/participer.md` | Creer la page Participer | Ajouter programme pilote, public, retours attendus, contact temporaire | Contact final a preciser | `/formation-ia/participer/` est accessible |
| [x] | 8 | `_config.yml` | Verifier la collection | Aucune modification necessaire apres verification | Changer le layout par defaut pourrait affecter les modules existants | Les modules existants restent accessibles |
| [x] | 9 | `_data/navigation.yml` | Verifier le lien global | Aucune modification necessaire apres verification | Faible risque de duplication | Le menu principal pointe vers la nouvelle section |

## Pages publiques visees

### `/formation-ia/`

Accueil de l'espace Formation IA.

Contenu prevu :

- titre : Formation IA utile, humaine et responsable ;
- sous-titre : mini-cours et ressources pour utiliser l'IA sans jargon ;
- acces vers Mini-cours, Ressources, Newsletter, Participer ;
- promesse : "L'IA ne remplace pas votre metier ; elle vous aide sur ce qui n'est pas votre metier."

### `/formation-ia/mini-cours/`

Liste des premiers mini-cours prevus :

- Bien demarrer avec une IA conversationnelle ;
- Rediger plus vite sans perdre son style ;
- Organiser ses idees et ses taches avec un LLM ;
- Utiliser l'IA avec sobriete et discernement.

Chaque element sera affiche comme une carte "a venir".

### `/formation-ia/ressources/`

Emplacements pour ressources pratiques :

- modeles de prompts ;
- fiches methode ;
- checklists ;
- exemples d'usages simples.

### `/formation-ia/newsletter/`

Page simple pour presenter la future newsletter.

Aucun outil externe ne sera connecte pour l'instant.

### `/formation-ia/participer/`

Page pour inviter des auto-entrepreneurs ou publics non techniques a tester les
premiers contenus.

Contenu prevu :

- objectif du programme pilote ;
- public concerne ;
- types de retours attendus ;
- lien ou bouton de contact temporaire.

## Choix de conception proposes

- Garder Jekyll comme source de verite.
- Ne pas ajouter de framework.
- Ne pas ajouter de backend.
- Ne pas creer de LMS.
- Isoler le style avec un CSS dedie.
- Garder le site principal intact.
- Garder la collection `_formation_ia` pour les futurs vrais modules.
- Utiliser des pages Markdown simples pour les sous-sections publiques.

## Points a valider avant implementation

- Valider le plan general.
- Confirmer si les pages anglaises doivent etre creees maintenant ou plus tard.
- Confirmer le type de contact temporaire pour la page Participer.
- Confirmer si les modules existants de `_formation_ia` doivent rester visibles
  depuis la page Mini-cours ou rester en retrait pour le moment.
