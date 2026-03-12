---
layout: home
title: Articles
permalink: /en/articles/
lang: en
translation_key: articles-index
---
{% assign current_lang = page.lang | default: "fr" %}
{% assign i18n = site.data.site_text[current_lang] %}
{% assign tags_path = '/tags' %}
{% if current_lang == "en" %}
  {% assign tags_path = '/en/tags' %}
{% endif %}

{% assign posts = site.posts | where: "lang", current_lang %}

<div class="posts-grid">
  <ul class="posts-list list-unstyled" role="list">
    {% for post in posts %}
    <li class="post-preview">
      <article>
        <a href="{{ post.url | absolute_url }}">
          <h2 class="post-title">{{ post.title | strip_html }}</h2>
          {% if post.subtitle %}
          <h3 class="post-subtitle">
            {{ post.subtitle | strip_html }}
          </h3>
          {% endif %}
        </a>
        
        {% if post.feature-image %}
        <div class="feature-image-container">
          <a href="{{ post.url | absolute_url }}">
            <img class="feature-image" src="{{ post.feature-image | absolute_url }}" alt="Feature image for {{ post.title }}">
          </a>
        </div>
        {% endif %}
        
        {% if post.author %}
        <span>{{ i18n.ui.by }} <strong>{{ post.author | strip_html }}</strong></span>
        {% endif %}
        <p class="post-meta">
          {% assign date_format = site.date_format | default: "%B %-d, %Y" %}
          {{ i18n.ui.posted_on }} {{ post.date | date: date_format }}
        </p>
        
        <div class="post-entry">
          {% assign excerpt_length = site.excerpt_length | default: 50 %}
          {{ post.excerpt | strip_html | truncatewords: excerpt_length }}
          {% assign excerpt_word_count = post.excerpt | number_of_words %}
          {% if post.content != post.excerpt or excerpt_word_count > excerpt_length %}
            <a href="{{ post.url | absolute_url }}" class="post-read-more">{{ i18n.ui.read_more }}</a>
          {% endif %}
        </div>
        
        {% if site.feed_show_tags != false and post.tags.size > 0 %}
        <div class="blog-tags">
          <span>{{ i18n.ui.tags }}</span>
          <ul class="d-inline list-inline" role="list">
            {% for tag in post.tags %}
            <li class="list-inline-item">
              <a href="{{ tags_path | absolute_url }}#{{- tag -}}">{{- tag -}}</a>
            </li>
            {% endfor %}
          </ul>
        </div>
        {% endif %}
      </article>
    </li>
    {% endfor %}
  </ul>
</div>

{% if paginator.total_pages > 1 %}
<ul class="pagination main-pager">
  {% if paginator.previous_page %}
  <li class="page-item previous">
    <a class="page-link" href="{{ paginator.previous_page_path | absolute_url }}">
      <i class="fas fa-arrow-left" alt="{{ i18n.ui.newer_posts }}"></i>
      <span class="d-none d-sm-inline-block">{{ i18n.ui.newer_posts }}</span>
    </a>
  </li>
  {% endif %}
  {% if paginator.next_page %}
  <li class="page-item next">
    <a class="page-link" href="{{ paginator.next_page_path | absolute_url }}">
      <span class="d-none d-sm-inline-block">{{ i18n.ui.older_posts }}</span>
      <i class="fas fa-arrow-right" alt="{{ i18n.ui.older_posts }}"></i>
    </a>
  </li>
  {% endif %}
</ul>
{% endif %}
