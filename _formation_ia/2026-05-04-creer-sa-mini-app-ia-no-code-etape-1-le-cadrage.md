---
layout: project
title: "Créer sa mini-app IA - Étape 1 : le cadrage"
subtitle: "Transformer une idée floue en brief clair avant de créer une mini-application IA sous forme de chatbot."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1777911773/mini_app_jjnqal.png"
tags: [Formation IA, chatbot, cadrage, mini-app]
author: Héric Libong
date: "2026-05-04 00:01:00 +02:00"
permalink: /formation-ia/mini-cours/2026-05-04-creer-sa-mini-app-ia-no-code-etape-1-le-cadrage/
lang: fr
translation_key: formation-ia-creer-sa-mini-app-ia-etape-1-le-cadrage
content_type: mini-cours
level: débutant
duration: "45 minutes"
audience: "Public francophone non technique souhaitant créer une mini-app IA avec des outils gratuits"
status: publié
css:
  - /assets/css/formation-ia.css
---

{% include formation_mini_app_intro.html %}

## Présentation du module

Dans cette première étape, vous allez apprendre à transformer une idée encore floue en **brief clair de mini-app IA**.

L’objectif n’est pas encore de créer l’application.

Avant de choisir un outil, avant de créer une interface, avant de demander à l’IA de produire du contenu, vous allez clarifier :

- ce que vous voulez créer ;
- à qui cela s’adresse ;
- ce que l’utilisateur pourra faire ;
- comment l’IA devra répondre ;
- quelles limites il faudra lui donner ;
- quelle matière de départ vous allez utiliser.

À la fin de cette étape, vous aurez un **document de cadrage complet**, prêt à copier dans un Google Doc, Notion, Word ou tout autre support.

Ce document servira de fondation pour toute la suite : il aidera à choisir les bons contenus, à cadrer le comportement de l’IA, à préparer les prochaines étapes et à éviter que la mini-app parte dans tous les sens.

---

## Pourquoi commencer par le cadrage ?

Quand on découvre l’IA, on a souvent envie de commencer directement par l’outil :

> “Je vais demander à ChatGPT, Gemini ou Claude de me créer une application.”

Mais si votre idée n’est pas claire, l’IA risque de produire quelque chose de flou, trop général ou difficile à utiliser.

Le cadrage sert à donner une direction.

Il permet d’éviter trois erreurs fréquentes :

1. vouloir créer une application trop complexe dès le départ ;
2. demander à l’IA de tout décider à votre place ;
3. obtenir des réponses jolies, mais inutilisables.

Une mini-app IA peut être très simple.  
Mais elle doit avoir une intention claire.

---

## Ce que vous allez produire

À la fin de cette étape, vous obtiendrez un brief contenant :

```text
Nom provisoire :
Intention :
Public visé :
Besoin de départ :
Fonction principale :
Modes d’usage :
Ce que l’IA doit faire :
Ce que l’IA ne doit pas faire :
Ton et style :
Matière de départ :
Phrase boussole :
```

Ce brief servira ensuite pour les étapes suivantes :

- créer la matière de départ ;
- rédiger les cartes d’exploration ou contenus ;
- concevoir l’agent IA ;
- préparer une mini-interface ;
- tester votre mini-app avec quelques utilisateurs.

---

## Deux façons de réaliser cette étape

Vous pouvez faire cette étape de deux manières.

### Option 1 - Méthode document

Vous remplissez vous-même le template dans un document.

Format conseillé :

- Google Doc ;
- Notion ;
- Word ;
- document Markdown.

Cette méthode est simple et rassurante.  
Elle convient si vous aimez écrire tranquillement, relire et corriger à votre rythme.

### Option 2 - Méthode AI-native

Vous utilisez une IA comme assistant de cadrage.

Dans ce cas, vous copiez un **master prompt** dans ChatGPT, Gemini, Claude ou un autre assistant IA.

L’IA vous pose ensuite les questions une par une.

À la fin, elle génère automatiquement votre brief complet.

Cette méthode est plus interactive.  
Elle permet aussi d’apprendre une nouvelle manière de dialoguer avec l’IA.

---

## Option 1 - Remplir le cadrage dans un Google Doc

**Ressource à télécharger :** [template de cadrage vierge]({{ '/assets/downloads/formation-ia/template_cadrage_mini_app_ia.md' | relative_url }})

Ce fichier au format Markdown contient toutes les rubriques du brief, prêtes à remplir. Vous pouvez l’ouvrir avec un simple éditeur de texte, ou en copier le contenu directement dans Google Docs, Notion ou Word.

### Étape pratique

1. Ouvrez Google Docs.
2. Créez un nouveau document.
3. Nommez-le :

```text
Cadrage mini-app IA - [Nom de votre projet]
```

4. Copiez le template de cadrage.
5. Remplissez les rubriques au fur et à mesure.
6. Relisez votre document à la fin de l’étape.
7. Gardez ce document : il servira pour les prochaines étapes.

### Conseil

N’essayez pas d’avoir un document parfait dès le départ.

Le cadrage est un document de travail.  
Il pourra évoluer.

---

## Option 2 - Utiliser l’assistant de cadrage IA

**Ressource à télécharger :** [master prompt de l’assistant de cadrage]({{ '/assets/downloads/formation-ia/master_prompt_assistant_cadrage_v3.md' | relative_url }})

Ce fichier au format Markdown contient le prompt complet à copier-coller dans votre outil IA (ChatGPT, Gemini, Claude ou autre). C’est lui qui transforme l’IA en assistant de cadrage guidé par commandes.

### Étape pratique

1. Ouvrez votre outil IA : ChatGPT, Gemini, Claude ou autre.
2. Créez une nouvelle conversation.
3. Copiez-collez le master prompt fourni dans ce module.
4. Envoyez le message.
5. Tapez ensuite :

```text
/start
```

6. L’assistant vous guidera étape par étape.
7. Répondez simplement aux questions.
8. À la fin, tapez :

```text
/finaliser
```

9. Copiez le brief final dans un Google Doc ou un autre support.

### Commandes disponibles dans l’assistant

L’assistant affiche les commandes à chaque étape.

Les principales commandes sont :

```text
/help      → obtenir une aide sur l’étape en cours
/resume    → voir vos réponses déjà enregistrées
/back      → revenir à l’étape précédente
/edit 3    → modifier la rubrique numéro 3
/brief     → afficher un brouillon du brief
/finaliser → générer le brief final
/reset     → recommencer depuis le début
```

Ces commandes ne sont pas techniques.  
Ce sont simplement des mots-clés pour guider la conversation.

---

## Exemple fil rouge

La méthode présentée ici peut servir à des projets très différents, dès lors que l’on souhaite **partager un savoir, transmettre une pratique ou ouvrir une réflexion**.

Quelques exemples possibles :

- une mini-app pour explorer des concepts de philosophie politique ;
- une mini-app pour s’initier à la mythologie ou aux sciences initiatiques ;
- une mini-app pour accompagner une pratique de sophrologie ;
- une mini-app pour transmettre un savoir de jardinage saisonnier ;
- une mini-app pour découvrir l’univers de la philatélie.

Dans ce module, nous prenons un exemple précis : une **mini-app d’initiation à la philosophie politique**, destinée à des adultes.

L’idée :

> créer une mini-app qui aide à explorer des concepts politiques, des auteurs et des controverses, sans imposer une opinion.

Exemples de sujets possibles dans cette mini-app :

- la banalité du mal chez Hannah Arendt ;
- l’État chez Hobbes ;
- le pouvoir chez Foucault.

L’application ne doit pas dire à l’utilisateur quoi penser.

Elle doit l’aider à comprendre comment une pensée se construit, se discute et s’oppose à d’autres pensées.

> Le principe reste transposable. Que vous travailliez sur la sophrologie, le jardin ou les timbres, la même logique s’applique : une mini-app n’impose pas, elle ouvre, explique et fait dialoguer.

---

# Déroulé des activités

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 1 - Donner un nom provisoire</summary>

Le nom provisoire sert à identifier votre projet.

Il n’a pas besoin d’être définitif.  
Il permet simplement de donner une première forme à votre idée.

Exemple :

```text
Atelier de philosophie politique
```

À vous :

```text
Nom provisoire de ma mini-app :
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 2 - Clarifier l’intention</summary>

L’intention répond à la question :

> À quoi sert cette mini-app ?

Exemple :

```text
Cette mini-app aide des adultes à explorer des concepts de philosophie politique à travers des auteurs, des textes, des controverses et des exemples historiques, sans imposer une opinion.
```

À vous :

```text
Cette mini-app aide à :
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 3 - Identifier le public visé</summary>

Une mini-app utile ne s’adresse pas à “tout le monde”.

Il faut préciser le public pour adapter le niveau, le ton et les exemples.

Exemple :

```text
Des adultes curieux, non spécialistes ou semi-initiés, qui veulent comprendre des concepts politiques exigeants sans passer directement par un cours universitaire complet.
```

À vous :

```text
Ma mini-app s’adresse à :
```

Niveau possible :

```text
[ ] Débutant adulte motivé
[ ] Curieux avec quelques bases
[ ] Intermédiaire
[ ] Lecteur avancé
[ ] Professionnel / enseignant / médiateur
[ ] Autre
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 4 - Définir le besoin de départ</summary>

Le besoin explique pourquoi cette mini-app mérite d’exister.

Exemple :

```text
Aider des adultes à comprendre des concepts de philosophie politique sans tomber dans le résumé scolaire, le jargon universitaire ou le discours partisan.
```

À vous :

```text
Le besoin de départ est :
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 5 - Définir la fonction principale</summary>

La fonction principale décrit ce que l’utilisateur pourra faire concrètement.

Exemple :

```text
L’utilisateur pourra saisir un concept ou un auteur, puis demander une explication, une comparaison, une mise en contexte ou une problématisation.
```

À vous :

```text
L’utilisateur pourra :
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 6 - Choisir les modes d’usage</summary>

Les modes rendent l’expérience plus interactive.

Exemples :

```text
Comprendre un concept
Situer un auteur
Comparer deux pensées
Problématiser une question
Lire un extrait
Préparer une discussion
```

À vous :

```text
Mode 1 :
Mode 2 :
Mode 3 :
Mode 4 :
Mode 5 :
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 7 - Définir ce que l’IA doit faire</summary>

Cette étape définit le comportement attendu de l’IA.

Exemple :

```text
L’IA doit expliquer les concepts avec clarté, situer les auteurs, distinguer concept, doctrine et opinion, faire apparaître les tensions théoriques et éviter les réponses partisanes.
```

À vous :

```text
L’IA doit toujours :
1.
2.
3.
4.
5.
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 8 - Définir ce que l’IA ne doit pas faire</summary>

Cette étape fixe les limites.

Exemple :

```text
L’IA ne doit pas dire quoi penser politiquement, transformer un concept en slogan, inventer des citations, caricaturer un auteur ou répondre comme une fiche de révision scolaire.
```

À vous :

```text
L’IA ne doit surtout pas :
1.
2.
3.
4.
5.
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 9 - Définir le ton et le style</summary>

Le ton influence beaucoup l’expérience utilisateur.

Exemple :

```text
Le ton doit être adulte, clair, exigeant, nuancé et accessible sans être simpliste.
```

À éviter :

```text
scolaire, militant, moralisateur, infantilisant, jargonneux
```

À vous :

```text
Le ton doit être :

Le ton à éviter :
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 10 - Identifier la matière de départ</summary>

Une mini-app IA a besoin d’une matière de départ.

Cela peut être :

- notes personnelles ;
- fiches de lecture ;
- PDF ;
- liens ;
- livres ;
- citations vérifiées ;
- questions fréquentes ;
- exemples ;
- supports existants.

Exemple :

```text
1. La banalité du mal chez Arendt
2. L’État chez Hobbes
3. Le pouvoir chez Foucault
```

À vous :

```text
Ma matière de départ sera :
1.
2.
3.
```

</details>

<details class="formation-ia-activity-toggle" markdown="1">
<summary>Activité 11 - Écrire la phrase boussole</summary>

La phrase boussole résume le projet.

Elle aide à garder le cap pendant toute la création.

Exemple :

```text
L’application ne dit pas quoi penser ; elle aide à comprendre comment les concepts politiques se construisent, se discutent et s’opposent.
```

À vous :

```text
Phrase boussole de ma mini-app :
```

</details>

<details class="formation-ia-activity-toggle formation-ia-activity-toggle-final" markdown="1">
<summary>Validation finale</summary>

Avant de passer à la suite, vérifiez que vous avez :

```text
[ ] un nom provisoire
[ ] une intention claire
[ ] un public identifié
[ ] un besoin de départ
[ ] une fonction principale
[ ] des modes d’usage
[ ] des règles pour l’IA
[ ] des limites pour l’IA
[ ] un ton défini
[ ] une matière de départ
[ ] une phrase boussole
```

Si tout est clair, vous pouvez passer à l’étape suivante.

</details>

---

## Fin de l’étape 1

Vous avez maintenant le cadrage de votre mini-app IA.

Dans l’étape suivante, vous allez créer la matière qui alimentera l’application.

Nous ne créerons pas de simples fiches-réponses.

Nous créerons des **cartes d’exploration** : des supports ouverts qui donnent à l’IA de la matière pour expliquer, comparer, situer, problématiser et relancer la réflexion.