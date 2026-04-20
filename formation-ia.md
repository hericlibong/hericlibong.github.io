---
layout: home
title: Formation IA
permalink: /formation-ia/
lang: fr
translation_key: formation-ia-index
---
{% assign current_lang = page.lang | default: "fr" %}
{% assign i18n = site.data.site_text[current_lang] %}

{% assign all_modules = site.formation_ia | where: "lang", current_lang | sort: 'date' | reverse %}

<div class="projects-container">

  <section id="standard-projects">
    <h1 class="page-title">{{ i18n.ui.formation_ia_title }}</h1>
    <div class="posts-grid">
      <ul class="posts-list list-unstyled" role="list">
        {% for project in all_modules %}
          {% include project_preview.html project=project %}
        {% endfor %}
      </ul>
    </div>
  </section>

</div>

<style>
  .page-title { margin-bottom: 1.5rem; color: #333; }
</style>
