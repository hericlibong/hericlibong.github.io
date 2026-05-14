---
layout: project
title: "Datascope"
subtitle: "An assistant that reveals the data potential of journalistic articles."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1778754295/Capture_d_%C3%A9cran_2026-05-14_122408_cyopp2.png"
tags: [journalism, data, nlp, flask, python, spacy, openai, llm, datafication]
author: Héric Libong
date: "2026-05-14"
lang: en
translation_key: project-datascope
permalink: /en/projects/datascope/
---

## Background

**Datascope** is a web application designed to help journalists uncover the "data" potential hidden inside an article. The tool combines local Natural Language Processing (NLP) with generative AI to extract key entities from a text, compute a "datafication" score, suggest editorial angles, and recommend relevant open data sources.

The goal is to provide a lightweight assistant that supports the investigation and ideation phase, turning a raw article into actionable leads for data journalism.

🔗 **Live app**: [datascope.onrender.com](https://datascope.onrender.com/)

## Features

- **Entity extraction**: automatic detection of people, places, dates, numbers and organisations via local NLP
- **Datafication score**: a synthetic indicator that estimates how much data potential an article holds
- **Editorial angle suggestions**: LLM-powered generation of journalistic angles
- **Open data sources**: recommendations of relevant APIs or datasets to explore further
- **Multilingual support**: analysis of articles in French and English (selectable through the UI)
- **Multi-format input**: handles raw text, PDF files and Word documents
- **Export**: download the analysis as Markdown or JSON

## Tech stack

### Backend and NLP

- **Python 3.12** and **Flask** for the web application
- **spaCy** for local language processing (`fr_core_news_sm`, `en_core_web_sm`)
- **OpenAI API** for editorial angles and content suggestions
- **pdfminer** and **python-docx** for multi-format input handling

### Quality and testing

- **pytest** for unit and integration tests
- Test coverage above 80% (`pytest-cov`)
- **black** for code formatting

### Deployment

- Containerised with `Dockerfile` and `docker-compose.yml`
- Deployed in production on **Render.com**
- Simple email-based authentication

## Architecture

The project is built around clearly separated modules:

- `app/`: Flask routes, views and Jinja2 templates
- `core/`: processing pipeline (NLP, LLM calls, parsing, exports)
- `tests_pytest/`: unit and integration tests
- `uploads/`: temporary storage for submitted articles

This separation allows the analysis layer (NLP + LLM) and the web interface to evolve independently.

## Project status

**Deployed and live.** The application is publicly accessible and already covers the main use cases: multi-format import, bilingual analysis, angle generation and export. Future iterations will focus on enriching the catalogue of open data sources proposed and refining the datafication score.

## Useful links

- **Live app**: [datascope.onrender.com](https://datascope.onrender.com/)
- **Source code**: [github.com/hericlibong/datascope_project](https://github.com/hericlibong/datascope_project)
