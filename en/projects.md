---
layout: home
title: Projects
permalink: /en/projects/
lang: en
translation_key: projects-index
---
{% assign current_lang = page.lang | default: "fr" %}
{% assign i18n = site.data.site_text[current_lang] %}

{% assign all_projects = site.projects | where: "lang", current_lang | sort: 'date' | reverse %}
{% assign standard_projects = all_projects | where_exp: "item", "item.category != 'hackathon'" %}
{% assign hackathons = all_projects | where: "category", "hackathon" %}

<div class="projects-container">
  
  <section id="standard-projects">
    <h1 class="page-title">{{ i18n.ui.f1_personal_projects }}</h1>
    <div class="posts-grid">
      <ul class="posts-list list-unstyled" role="list">
        {% for project in standard_projects %}
          {% include project_preview.html project=project %}
        {% endfor %}
      </ul>
    </div>
  </section>

  {% if hackathons.size > 0 %}
  <hr class="section-divider">
  
  <section id="hackathons">
    <h1 class="page-title">{{ i18n.ui.f1_hackathons }}</h1>
    <p class="section-subtitle">{{ i18n.ui.f1_hackathon_subtitle }}</p>
    <div class="posts-grid">
      <ul class="posts-list list-unstyled" role="list">
        {% for project in hackathons %}
          {% include project_preview.html project=project %}
        {% endfor %}
      </ul>
    </div>
  </section>
  {% endif %}

</div>

<style>
  .section-divider { margin: 3rem 0; border-top: 2px solid #eee; }
  .page-title { margin-bottom: 1.5rem; color: #333; }
  .section-subtitle { margin-bottom: 2rem; font-style: italic; color: #666; }
</style>
