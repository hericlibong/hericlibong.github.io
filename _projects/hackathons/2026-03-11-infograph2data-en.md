---
layout: project
title: "Infograph2Data: turning infographics into reusable datasets with AI"
subtitle: "Visuals often contain valuable data, but numbers are rarely available in structured form."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1773274364/githubhackathon_jas5rt.png"
tags: [hackathon, innovation, data, ai]
author: Héric Libong
date: "2026-03-11"
category: hackathon
lang: en
translation_key: project-infograph2data
permalink: /en/projects/infograph2data/
---

## Challenge
During an AI-focused hackathon, we explored a recurring issue in data work and journalism:

Much published information exists only as **charts and infographics**, making direct reuse difficult because values are not exposed as structured data.

Main question:

> Can multimodal AI models reconstruct a dataset from a visualization?

## Proposed solution

The **Infograph2Data** prototype transforms visualizations into **usable datasets**.

Workflow:

1. User uploads an image or PDF with a chart
2. App detects visual components
3. Multimodal model analyzes the chart
4. Detected values are converted to structured tables
5. User exports the result

Supported formats include PNG/JPG screenshots, infographics, and PDFs.

## Stack

- Python, FastAPI, Pydantic
- OpenAI multimodal models
- JSON structured extraction
- Poppler/pdf2image for PDF conversion
- pytest with high test coverage
- Docker + Hugging Face Spaces for demos

## Result

The project delivered a functional MVP proving that multimodal models can recover datasets from visual artifacts, even when some values must be estimated.
