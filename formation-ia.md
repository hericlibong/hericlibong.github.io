---
layout: home
title: Formation IA
permalink: /formation-ia/
lang: fr
translation_key: formation-ia-index
---
{% assign current_lang = page.lang | default: "fr" %}
{% assign i18n = site.data.site_text[current_lang] %}

{% assign modules = site.formation_ia | where: "lang", current_lang | sort: 'date' | reverse %}

<div class="formation-ia-container">

  <section id="formation-ia-modules">
    <h1 class="page-title">{{ i18n.ui.formation_ia_title }}</h1>
    <p class="section-subtitle">{{ i18n.ui.formation_ia_subtitle }}</p>

    {% if modules.size > 0 %}
    <div class="posts-grid">
      <ul class="posts-list list-unstyled" role="list">
        {% for module in modules %}
          {% include project_preview.html project=module %}
        {% endfor %}
      </ul>
    </div>
    {% else %}
    <p class="formation-ia-empty">{{ i18n.ui.formation_ia_empty }}</p>
    {% endif %}
  </section>

</div>

<style>
  .page-title { margin-bottom: 1.5rem; color: #333; }
  .section-subtitle { margin-bottom: 2rem; font-style: italic; color: #666; }
  .formation-ia-empty { margin-top: 1.5rem; color: #666; font-style: italic; }
</style>
