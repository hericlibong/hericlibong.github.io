---
layout: home
title: Projets
permalink: /projects/
---

{% assign posts = site.projects %}

<div class="posts-grid">
  <ul class="posts-list list-unstyled" role="list">
    {% for project in site.projects %}
    <li class="post-preview">
      <article>
        <a href="{{ project.url | absolute_url }}">
          <h2 class="post-title">{{ project.title | strip_html }}</h2>
          {% if project.subtitle %}
          <h3 class="post-subtitle">
            {{ project.subtitle | strip_html }}
          </h3>
          {% endif %}
        </a>
        
        {% if project.feature-image %}
        <div class="feature-image-container">
          <a href="{{ project.url | absolute_url }}">
            <img class="feature-image" src="{{ project.feature-image | absolute_url }}" alt="Feature image for {{ project.title }}">
          </a>
        </div>
        {% endif %}
        
        {% if project.author %}
        <span>By <strong>{{ project.author | strip_html }}</strong></span>
        {% endif %}
        <p class="post-meta">
          {% assign date_format = site.date_format | default: "%B %-d, %Y" %}
          Posted on {{ project.date | date: date_format }}
        </p>
        
        <div class="post-entry">
          {% assign excerpt_length = site.excerpt_length | default: 50 %}
          {{ project.excerpt | strip_html | truncatewords: excerpt_length }}
          {% assign excerpt_word_count = project.excerpt | number_of_words %}
          {% if project.content != project.excerpt or excerpt_word_count > excerpt_length %}
            <a href="{{ project.url | absolute_url }}" class="post-read-more">[Read More]</a>
          {% endif %}
        </div>
        
        {% if site.feed_show_tags != false and project.tags.size > 0 %}
        <div class="blog-tags">
          <span>Tags:</span>
          <ul class="d-inline list-inline" role="list">
            {% for tag in project.tags %}
            <li class="list-inline-item">
              <a href="{{ '/tags' | absolute_url }}#{{- tag -}}">{{- tag -}}</a>
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
      <i class="fas fa-arrow-left" alt="Newer Posts"></i>
      <span class="d-none d-sm-inline-block">Newer Posts</span>
    </a>
  </li>
  {% endif %}
  {% if paginator.next_page %}
  <li class="page-item next">
    <a class="page-link" href="{{ paginator.next_page_path | absolute_url }}">
      <span class="d-none d-sm-inline-block">Older Posts</span>
      <i class="fas fa-arrow-right" alt="Older Posts"></i>
    </a>
  </li>
  {% endif %}
</ul>
{% endif %}