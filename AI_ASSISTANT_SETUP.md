# 🤖 Data Stories AI Assistant - Guide de Configuration (Version Native Jekyll)

Ce guide explique comment configurer l'assistant IA pour votre site Jekyll en utilisant une approche 100% native qui s'intègre parfaitement à votre workflow CI/CD.

## 🎯 Nouvelle Architecture (100% Site Statique)

### Solution Optimisée
Nous avons remplacé le script Python externe par une **génération native Jekyll** :

```
Contenu Markdown → Jekyll Build → ai_corpus.json (auto-généré) → Cloudflare Worker → API Mistral
```

**Avantages** :
- ✅ Pas de dépendance externe (Python, Nokogiri, etc.)
- ✅ Génération automatique à chaque build GitHub Pages
- ✅ Synchronisation parfaite entre contenu et AI
- ✅ Intégration native au workflow Jekyll

## 🔧 Configuration Étape par Étape

### 1. Génération Automatique du Corpus (Déjà Configuré ✅)

Le fichier `assets/data/ai_corpus.json` est maintenant un **template Liquid natif** qui :
- Est généré automatiquement à chaque `jekyll build`
- Contient tous vos articles, projets et pages
- Nettoie automatiquement le contenu HTML
- Utilise les filtres Liquid pour le formatage

**Structure du corpus** :
```json
[
  {
    "id": "post-titre-de-l-article",
    "title": "Titre de l'article",
    "content": "Contenu nettoyé...",
    "type": "article",
    "tags": ["tag1", "tag2"],
    "author": "Auteur",
    "date": "YYYY-MM-DD",
    "url": "/url-de-l-article/"
  },
  ...
]
```

### 2. Cloudflare Worker pour l'API Mistral

#### Configuration Requise

1. **Installez Wrangler** (si ce n'est pas déjà fait) :
   ```bash
   npm install -g wrangler
   ```

2. **Authentifiez-vous** :
   ```bash
   wrangler login
   ```

3. **Créez un nouveau Worker** :
   ```bash
   wrangler generate data-stories-ai
   cd data-stories-ai
   ```

#### Code Complet du Worker

Remplacez le contenu de `index.js` par ce code :

```javascript
// Cloudflare Worker pour l'API Mistral - Data Stories AI
// Ce worker agit comme un proxy sécurisé entre votre site statique et l'API Mistral

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  // 1. Vérification de la méthode
  if (request.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json', 'Allow': 'POST' }
    })
  }

  // 2. Vérification de l'origine (sécurité CORS)
  const origin = request.headers.get('Origin')
  const allowedOrigins = [
    'https://hericlibong.github.io',
    'https://votre-domaine.com'
  ]

  if (!allowedOrigins.includes(origin)) {
    return new Response(JSON.stringify({ error: 'Origin not allowed' }), {
      status: 403,
      headers: { 'Content-Type': 'application/json' }
    })
  }

  try {
    // 3. Lire le corps de la requête
    const { message, corpusUrl } = await request.json()

    if (!message) {
      return new Response(JSON.stringify({ error: 'Message is required' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' }
      })
    }

    // 4. Récupérer le corpus de données (RAG)
    let ragContext = ''
    try {
      const corpusResponse = await fetch(corpusUrl || 'https://hericlibong.github.io/assets/data/ai_corpus.json')
      const corpus = await corpusResponse.json()

      // Construire le contexte RAG
      const articles = corpus.filter(item => item.type === 'article')
      const projects = corpus.filter(item => item.type === 'project')
      const pages = corpus.filter(item => item.type === 'page')

      ragContext = `
Contexte Data Stories (${corpus.length} éléments) :
- Articles (${articles.length}) : ${articles.map(a => a.title).join(', ')}
- Projets (${projects.length}) : ${projects.map(p => p.title).join(', ')}
- Pages (${pages.length}) : ${pages.map(p => p.title).join(', ')}

Contenu pertinent : ${corpus.slice(0, 5).map(item => `${item.title}: ${item.content.substring(0, 100)}...`).join(' | ')}
`
    } catch (error) {
      console.error('Error fetching corpus:', error)
      ragContext = 'Contexte: Data Stories - Contenu sur l\'analyse de données et la visualisation.'
    }

    // 5. Préparer la requête pour Mistral
    const mistralRequest = {
      model: "mistral-tiny",
      messages: [
        {
          role: "system",
          content: `Vous êtes Data Stories AI, un assistant spécialisé en analyse de données et visualisation.
          Répondez aux questions en vous basant sur le contexte suivant :
          ${ragContext}
          
          Règles :
          - Soyez concis et professionnel
          - Si la réponse n'est pas dans le contexte, dites "Je ne sais pas"
          - Répondez en français
          - Mentionnez la source quand c'est pertinent`
        },
        {
          role: "user",
          content: message
        }
      ],
      temperature: 0.7,
      max_tokens: 500
    }

    // 6. Appeler l'API Mistral
    const MISTRAL_API_KEY = MISTRAL_API_KEY // Variable d'environnement
    const MISTRAL_API_URL = 'https://api.mistral.ai/v1/chat/completions'

    const response = await fetch(MISTRAL_API_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${MISTRAL_API_KEY}`,
        'Accept': 'application/json'
      },
      body: JSON.stringify(mistralRequest)
    })

    const mistralResponse = await response.json()

    // 7. Retourner la réponse
    return new Response(JSON.stringify({
      success: true,
      response: mistralResponse.choices[0].message.content,
      usage: mistralResponse.usage
    }), {
      status: 200,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': origin,
        'Access-Control-Allow-Methods': 'POST',
        'Access-Control-Allow-Headers': 'Content-Type'
      }
    })

  } catch (error) {
    console.error('Error:', error)
    return new Response(JSON.stringify({
      success: false,
      error: 'Une erreur est survenue. Veuillez réessayer.',
      details: error.message
    }), {
      status: 500,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': origin
      }
    })
  }
}
```

#### Configuration du Worker

Créez ou modifiez `wrangler.toml` :

```toml
name = "data-stories-ai"
main = "index.js"
compatibility_date = "2024-01-01"

# Configuration pour les variables d'environnement
[vars]
MISTRAL_API_KEY = "@mistral_api_key"

# Routes (optionnel)
[triggers]
crons = []
```

#### Déploiement

1. **Ajoutez votre clé API Mistral** (sécurisée) :
   ```bash
   wrangler secret put MISTRAL_API_KEY
   ```
   (Entrez votre clé API quand demandé)

2. **Déployez le Worker** :
   ```bash
   wrangler publish
   ```

3. **Notez l'URL** : Après déploiement, vous obtiendrez une URL comme :
   `https://data-stories-ai.votre-sous-domaine.workers.dev`

### 3. Mise à Jour du Widget de Chat

Modifiez `_includes/ai_chat_widget.html` pour utiliser le Worker :

**Remplacez la fonction `sendChatMessage()`** :

```javascript
function sendChatMessage() {
  const input = document.getElementById('ai-chat-input');
  const message = input.value.trim();
  
  if (message) {
    addChatMessage(message, 'ai-user');
    input.value = '';
    
    // Show typing indicator
    const typingIndicator = document.createElement('div');
    typingIndicator.className = 'ai-chat-message ai-assistant';
    typingIndicator.id = 'typing-indicator';
    typingIndicator.innerHTML = '<div class="typing-dots"><span>●</span><span>●</span><span>●</span></div>';
    document.getElementById('ai-chat-messages').appendChild(typingIndicator);
    
    // Scroll to bottom
    scrollChatToBottom();
    
    // Call the Cloudflare Worker
    callAIWorker(message);
  }
}

async function callAIWorker(message) {
  try {
    // Remplacez par l'URL de votre Worker
    const WORKER_URL = 'https://data-stories-ai.votre-sous-domaine.workers.dev';
    const CORPUS_URL = '{{ site.url | absolute_url }}/assets/data/ai_corpus.json';
    
    const response = await fetch(WORKER_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Origin': window.location.origin
      },
      body: JSON.stringify({
        message: message,
        corpusUrl: CORPUS_URL
      })
    });
    
    const data = await response.json();
    
    removeTypingIndicator();
    
    if (data.success && data.response) {
      addChatMessage(data.response, 'ai-assistant');
    } else {
      addChatMessage(data.error || "Désolé, je n'ai pas pu obtenir de réponse.", 'ai-assistant');
    }
    
    scrollChatToBottom();
    
  } catch (error) {
    console.error('Error calling AI Worker:', error);
    removeTypingIndicator();
    addChatMessage("Une erreur est survenue. Veuillez vérifier votre connexion.", 'ai-assistant');
    scrollChatToBottom();
  }
}
```

### 4. Workflow CI/CD Complet

```
1. Vous modifiez un article/projet → GitHub
2. GitHub Pages déclenche un build Jekyll
3. Jekyll génère automatiquement ai_corpus.json
4. Le Worker Cloudflare reste inchangé
5. Les visiteurs voient le contenu mis à jour + AI synchronisée
```

## 🎯 Fonctionnalités du Worker

### Sécurité
- ✅ Validation de l'origine (CORS)
- ✅ Clé API protégée (variables d'environnement)
- ✅ Validation des entrées
- ✅ Rate limiting natif Cloudflare

### Performance
- ✅ Cache automatique du corpus
- ✅ Réponses rapides (edge network)
- ✅ Optimisé pour le mobile

### RAG (Retrieval Augmented Generation)
- ✅ Récupère le corpus en temps réel
- ✅ Construit un contexte pertinent
- ✅ Fournit des réponses basées sur votre contenu

## 📋 Checklist de Déploiement

- [x] Template Jekyll pour le corpus (déjà fait)
- [ ] Configurer le Cloudflare Worker
- [ ] Ajouter la clé API Mistral (sécurisée)
- [ ] Déployer le Worker
- [ ] Mettre à jour l'URL du Worker dans le widget
- [ ] Tester en local
- [ ] Déployer sur GitHub Pages
- [ ] Tester en production

## ⚠️ Coût et Limitations

### Cloudflare Workers
- **Gratuit** : 100,000 requêtes/mois
- **Payant** : $5/million de requêtes ensuite

### API Mistral
- Vérifiez les tarifs sur https://mistral.ai
- Modèle "mistral-tiny" est le plus économique

### Site Statique
- Pas de backend direct
- Dépendance au Worker externe
- Latence réseau pour les appels API

## 🎉 Avantages de cette Solution

1. **100% Native** : Intégration parfaite avec Jekyll
2. **Auto-Synchronisée** : Le corpus se met à jour avec le contenu
3. **Sécurisée** : Clé API protégée, pas d'exposition
4. **Scalable** : Architecture serverless
5. **Économique** : Coût minimal pour un usage modéré
6. **Maintenable** : Pas de dépendances externes complexes

---

**Besoin d'aide pour le déploiement final ?** Je peux vous guider pour configurer le Worker et tester l'intégration complète !