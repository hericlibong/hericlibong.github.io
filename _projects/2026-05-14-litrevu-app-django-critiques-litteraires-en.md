---
layout: project
title: "LitRevu — A Django app for book reviews"
subtitle: "A Django web application to request, publish and share reviews of books and articles."
feature-image: "https://res.cloudinary.com/dvlzgmjzb/image/upload/v1778761922/litRevu_2_trm2hw.png"
tags: [django, python, web-app, sqlite, postgresql, docker, rest-api]
author: Héric Libong
date: "2026-05-14"
lang: en
translation_key: project-litrevu
permalink: /en/projects/litrevu-app-django-critiques-litteraires/
---

## Background

**LitRevu** started as a training project, with one clear goal: put the **Django** framework into practice on a complete, end-to-end web application. The idea was to build a small community platform around reading, where users can either ask for recommendations or share their opinion about a book or an article.

The need is straightforward — let readers request or post reviews, follow other users and find every relevant publication in a personal, chronological feed.

Beyond the deliverable, the project is above all a hands-on playground for Django: relational models, authentication, forms, function- and class-based views, templates, and a project layout designed to scale and stay maintainable over time.

## Project overview

LitRevu is built around three core use cases:

1. **Request a review** by posting a ticket about a book or an article.
2. **Publish a review**, either in response to an existing ticket or as a standalone piece on a given work.
3. **Discover new reads** through the publications of the users you follow.

### Key features

- **Ticket creation**: users can open tickets to request a review of a specific book or article.
- **Review publication**: write a review in response to an existing ticket, or independently on any work.
- **Follow system**: each user can follow other accounts to surface their publications.
- **Personal feed**: a chronological dashboard mixing tickets and reviews from followed accounts together with the user's own publications.

### Authentication and demo

A demo SQLite database ships with the project, along with a test account (`opc-user` / `demo`) so the app can be explored without any prior setup.

## Tech stack

### Backend

- **Python 3.10+** and **Django** for the whole application
- **SQLite** by default for an easy onboarding, **PostgreSQL** planned for production
- **Django REST Framework** (in progress) to expose user profiles through an API
- Native Django authentication, extended by a `Profile` model (bio, picture, website)

### Frontend

- Django templates with layout inheritance
- Custom HTML and CSS, no heavy JavaScript framework

### Infrastructure and quality

- `.env` file for sensitive configuration (secret key, `DEBUG`, `ALLOWED_HOSTS`)
- **Docker** + `docker-compose` (in progress) to orchestrate the Django app and the PostgreSQL service
- **GitHub Actions** planned to automate tests and deployment to Render
- Unit and functional tests being added to secure future iterations

## Project status

**Refactoring in progress.** The first functional version covers the core use cases (tickets, reviews, follows, feed). An active roadmap is driving the next steps:

- Migration from SQLite to **PostgreSQL** in production
- **Richer user profiles** (bio, picture, personal website)
- **RESTful API** on profiles via Django REST Framework, secured with tokens
- Full **Docker containerisation**
- **CI/CD with GitHub Actions** deploying to Render
- API documentation (DRF Spectacular / Swagger) and stronger test coverage

Detailed task tracking lives in the [associated GitHub Project](https://github.com/users/hericlibong/projects/4).

## Useful links

- **Source code**: [github.com/hericlibong/Web_Django_App_LitRevu](https://github.com/hericlibong/Web_Django_App_LitRevu)
- **Project board**: [GitHub Project #4](https://github.com/users/hericlibong/projects/4)
