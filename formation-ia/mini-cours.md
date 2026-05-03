---
layout: formation_ia
title: Mini-cours
subtitle: Des parcours courts pour apprendre a utiliser l'IA dans des situations concretes, sans jargon inutile.
permalink: /formation-ia/mini-cours/
lang: fr
translation_key: formation-ia-mini-cours
css:
  - /assets/css/formation-ia.css
---
{% assign mini_courses = site.formation_ia | where: "lang", "fr" | where: "content_type", "mini-cours" | sort: "date" | reverse %}

<div class="formation-ia-panel">
  <p>
    Les mini-cours seront publies progressivement. Chaque module visera un usage
    precis, avec une approche simple : comprendre l'objectif, tester sur un cas
    concret, puis repartir avec une methode reutilisable.
  </p>
</div>

{% if mini_courses.size > 0 %}
<div class="formation-ia-grid">
  {% for course in mini_courses %}
  <a class="formation-ia-card" href="{{ course.url | relative_url }}">
    <div>
      <h2>{{ course.title }}</h2>
      {% if course.subtitle %}
        <p>{{ course.subtitle }}</p>
      {% else %}
        <p>{{ course.excerpt | strip_html | truncatewords: 24 }}</p>
      {% endif %}
    </div>
    <span class="formation-ia-pill">
      {% if course.status %}{{ course.status }}{% else %}Mini-cours{% endif %}
    </span>
  </a>
  {% endfor %}
</div>
{% else %}
<div class="formation-ia-grid">
  <article class="formation-ia-card">
    <div>
      <h2>Bien demarrer avec une IA conversationnelle</h2>
      <p>Comprendre comment dialoguer avec un assistant IA, formuler une demande claire et verifier les reponses.</p>
    </div>
    <span class="formation-ia-pill">A venir</span>
  </article>
</div>
{% endif %}

<div class="formation-ia-panel">
  <h2>Format prevu</h2>
  <p>
    Chaque mini-cours sera concu comme une sequence courte : une situation de
    depart, une methode, un exemple, puis un exercice ou une checklist simple.
  </p>

  <div class="formation-ia-actions">
    <a class="formation-ia-button formation-ia-button-secondary" href="{{ '/formation-ia/' | relative_url }}">Retour a l'accueil</a>
    <a class="formation-ia-button" href="{{ '/formation-ia/participer/' | relative_url }}">Participer au pilote</a>
  </div>
</div>
