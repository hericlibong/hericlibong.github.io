---
layout: project
title: "Sassy_AI l'assistant IA sarcatisque qui n'aime pas beaucoup les humains"
subtitle: "Un chatbot web qui répond (vraiment) utilement… mais avec un soupçon d’ironie, un peu de drama, et zéro patience pour les banalités."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1773314382/sassy_ai_i7aeca.png"
tags: [chatbot, openai, fastapi, python, javascript, spec-kit, github-copilot, gpt-codex, hugging-face, docker]
author: Héric Libong
date: "2026-03-12"
---

## **Description** : 
**Sassy_AI V2** est une refonte “portfolio-ready” d’un assistant sarcastique : on passe d’un projet orienté CLI à un **chatbot web** composé d’un frontend statique et d’un backend FastAPI.

Le cœur du projet, c’est l’équilibre “utile mais piquant” :
- le backend appelle un **LLM via OpenAI (Responses API)**, avec une **abstraction de provider** configurable par variables d’environnement ;
- le style est piloté par un **persona versionné** (`backend/persona/system_prompt.md` + `few_shot_examples.yaml`) et un **sarcasm_level** (low / medium / high) ;
- une **policy de sécurité** court-circuite les demandes unsafe (refuse/neutralize) et le système sait revenir en **fallback** en cas d’erreur provider.

Côté UX, l’interface est volontairement simple mais “propre” :
- reveal mot-par-mot (avec **Skip**),
- indicateur de saisie,
- badges de classification,
- quick prompts, copy, reset,
- rendu **Markdown sécurisé** (Markdown → HTML + sanitation) pour lire les réponses correctement.

**Agent codeur utilisé** : GitHub Copilot (mode agent / CLI) orchestré via Spec-Kit, avec le modèle **GPT-Codex 5.3 (medium)**.

---

## Objectifs

1. **Construire un chatbot web** clair et démontrable (objectif portfolio).
2. Remplacer le “stub” LLM par un **vrai provider OpenAI**, robuste (timeout, erreurs, fallback).
3. **Versionner et faire respecter** un persona (source de vérité), avec few-shot et niveaux de sarcasme.
4. Maintenir un scope strict :
   - pas d’auth,
   - pas de base de données,
   - sessions **in-memory**.
5. Améliorer l’UX du chat sans refonte lourde :
   - interface Option B,
   - reveal mot-par-mot + Skip,
   - outils “soft” (copy/reset/chips),
   - affichage Markdown propre.

---

## Technologies utilisées

### Backend
- **Python 3.12**
- **FastAPI** (API `/api/chat`, `/api/health`)
- **httpx** (appels OpenAI)
- Tests : **pytest** (unit + intégration + contract)

### Frontend
- HTML/CSS/JS en **ES Modules** (sans framework)
- UI “Option B” : layout léger, responsive
- Effets chat : typing indicator, reveal mot-par-mot, Skip
- Rendu Markdown : **marked** + **DOMPurify** (sanitization)

### Tooling & workflow
- **Spec-Kit** (spec → plan → tasks → implement)
- **GitHub Copilot Agent** (modèle **GPT-Codex 5.3 (medium)**)
- Déploiement : **Docker** + **Hugging Face Spaces**

---

![Sassy_AI détourné](https://res.cloudinary.com/dvlzgmjzb/image/upload/v1773315450/sassy_ai_detoure_m8fnnz.png)

## État du projet

✅ Fonctionnel (MVP V2) :
- chat web opérationnel (frontend + backend)
- réponses LLM cohérentes avec persona + sarcasm_level
- Markdown rendu proprement (gras, listes, etc.) et sécurisé
- déployé sur Hugging Face

⚠️ À améliorer ensuite (si je pousse le projet plus loin) :
- streaming (token-by-token) côté backend + UI
- meilleure observabilité (sans fuite de prompt/secret)
- tests frontend (actuellement smoke + scénarios manuels)
- configuration “dev/prod” plus claire (URLs, CORS conditionnel)

---

## Liens utiles

- **Démo en ligne** : [https://ricolajazz-sassy-ai.hf.space](https://ricolajazz-sassy-ai.hf.space)  
- **Repo GitHub** : [https://github.com/hericlibong/SassyAI](https://github.com/hericlibong/SassyAI)  
- **Specs (SDD)** : `specs/001-rewrite-web-chatbot/` + `specs/002-character-ui-typing/`  
- **Persona** : `backend/persona/system_prompt.md` + `backend/persona/few_shot_examples.yaml`