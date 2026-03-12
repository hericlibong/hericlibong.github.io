---
layout: project
title: "Sassy_AI, the sarcastic assistant that doesn't really like humans"
subtitle: "A web chatbot that gives useful answers—with irony, a little drama, and zero patience for banality."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1773314382/sassy_ai_i7aeca.png"
tags: [chatbot, openai, fastapi, python, javascript, spec-kit, github-copilot, gpt-codex, hugging-face, docker]
author: Héric Libong
date: "2026-03-12"
lang: en
translation_key: project-sassy-ai
permalink: /en/projects/sassy-ai/
---

## Description
**Sassy_AI V2** is a portfolio-ready rewrite of a sarcastic assistant: from CLI project to a **web chatbot** with static frontend + FastAPI backend.

Core idea: useful, but with attitude.

- backend calls a real **LLM via OpenAI Responses API** with provider abstraction;
- tone controlled by a versioned persona and `sarcasm_level` (low/medium/high);
- safety policy handles unsafe requests and fallback behavior.

## Goals

1. Build a clear, demo-ready web chatbot.
2. Replace stubs with a robust OpenAI provider integration.
3. Version and enforce a stable persona.
4. Keep scope strict: no auth, no DB, in-memory sessions.
5. Improve UX: typing reveal, skip, quick prompts, copy/reset, safe markdown rendering.

## Tech stack

- Backend: Python 3.12, FastAPI, httpx, pytest
- Frontend: HTML/CSS/JS ES modules
- Markdown rendering: marked + DOMPurify
- Workflow: Spec-Kit + GitHub Copilot Agent
- Deployment: Docker + Hugging Face Spaces

![Sassy_AI visual](https://res.cloudinary.com/dvlzgmjzb/image/upload/v1773315450/sassy_ai_detoure_m8fnnz.png)

## Current status

✅ MVP V2 is functional:
- web chat works end-to-end
- persona + sarcasm behavior is consistent
- markdown output is safe and readable
- deployed on Hugging Face

## Useful links

- Demo: [https://ricolajazz-sassy-ai.hf.space](https://ricolajazz-sassy-ai.hf.space)  
- GitHub: [https://github.com/hericlibong/SassyAI](https://github.com/hericlibong/SassyAI)
