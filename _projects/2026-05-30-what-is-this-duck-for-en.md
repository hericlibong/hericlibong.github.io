---
layout: project
title: "What Is This Duck For?"
subtitle: "An absurd web app that asks AI to analyze a plastic duck with far too much seriousness."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1780151841/escalate_ministry_duck_persona_auwpky.png"
tags: [ia, fastapi, python, gemini, javascript, jinja2, hackathon]
author: Héric Libong
date: "2026-05-30"
lang: en
translation_key: project-what-is-this-duck-for
permalink: /en/projects/what-is-this-duck-for/
---

## Project origin

**What Is This Duck For?** started from a simple challenge: build an intentionally useless application, but make it clear, coherent, and polished enough for that uselessness to become the actual subject of the project.

The starting point is a trivial object: a yellow plastic duck. The application treats it as a serious, almost administrative matter, asking an AI to produce solemn explanations about its supposed purpose.

The point of the project is not to solve a practical problem. It explores a contrast instead: take an object with no stakes and apply the language of an official investigation, a ministry report, or an overconfident symbolic analysis.

The result works as a small experiment in interface, writing, and tone. The duck stays at the center, but every answer turns that banal object into a pseudo-scientific, mystical, bureaucratic, or openly suspicious diagnosis.

🔗 **Live demo**: [ricolajazz-whatisduckfor.hf.space](https://ricolajazz-whatisduckfor.hf.space/)

## Project overview

The application offers a short, theatrical web interface: a central duck, a report panel, very formal labels, and a visual mood inspired by official documents.

The user is not looking for a useful answer. They submit the same fundamental question: **what is this duck for?** The AI then replies according to the selected interpretation mode.

### Five analysis modes

- **Analyze the Duck**: a pseudo-scientific reading of the duck's function
- **Request Deeper Interpretation**: an over-intellectualized and symbolic interpretation
- **Escalate to Ministry**: a bureaucratic response where the duck gains ridiculous administrative importance
- **Trust the Duck**: a mystical reading that treats the duck as a silent authority
- **Do Not Trust the Duck**: a paranoid interpretation that refuses to believe in the duck's innocence

Each mode produces a short, structured, absurdly serious report. The writing constraint matters: the AI must stay readable, controlled, and specific to the selected mode, without drifting into generic noise.

![Escalate Ministry Duck Persona](https://res.cloudinary.com/dvlzgmjzb/image/upload/v1780151841/escalate_ministry_duck_persona_auwpky.png)

## Technical stack

### Backend and AI generation

- **Python** and **FastAPI** to serve the web application
- **Google Gemini API** to generate the absurd reports
- Separate prompts by persona to keep a distinct tone for each selected mode
- No user accounts, no database, no dashboard

### Frontend

- **Jinja2** for HTML templates
- Vanilla **HTML**, **CSS**, and **JavaScript** for the interface
- Visual staging centered on the duck and the report panel
- A deliberately lightweight architecture, suited to a short and demonstrable project

## Project status

The project is a finished concept: the FastAPI application exists, the main interface is in place, the five analysis modes are implemented, and report generation via Gemini is operational.

It is not designed as a product meant to evolve forever. Its value comes from its tight scope: an absurd idea, a coherent interface, a simple AI mechanism, and a tone serious enough for the joke to work.

## Useful links

- **Live demo**: [ricolajazz-whatisduckfor.hf.space](https://ricolajazz-whatisduckfor.hf.space/)
- **Source code**: [github.com/hericlibong/What_Is_This_Duck_For](https://github.com/hericlibong/What_Is_This_Duck_For)
