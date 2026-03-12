---
layout: page
title: 'Tag Index'
permalink: /en/tags/
lang: en
translation_key: tags-page
---
{% assign current_lang = page.lang | default: "fr" %}
{% assign i18n = site.data.site_text[current_lang] %}

{% assign date_format = site.date_format | default: "%B %-d, %Y" %}

{%- capture site_tags -%}
    {%- assign localized_posts = site.posts | where: "lang", current_lang -%}
    {%- for post in localized_posts -%}
      {%- for post_tag in post.tags -%}
        {{- post_tag -}},
      {%- endfor -%}
    {%- endfor -%}
{%- endcapture -%}
{%- assign tags_list = site_tags | split:',' | uniq | sort -%}

{%- for tag in tags_list -%}
    {% assign normalized_tag = tag | strip %}
    {% if normalized_tag != "" %}
    {% assign localized_tag_posts = site.tags[tag] | where: "lang", current_lang %}
    {% if localized_tag_posts.size > 0 %}
      <a href="#{{- normalized_tag -}}" class="btn btn-primary tag-btn"><i class="fas fa-tag" aria-hidden="true"></i>&nbsp;{{- normalized_tag -}}&nbsp;({{localized_tag_posts.size}})</a>
    {% endif %}
    {% endif %}
{%- endfor -%}

<div id="full-tags-list">
{%- for tag in tags_list -%}
    {% assign normalized_tag = tag | strip %}
    {% if normalized_tag != "" %}
    {% assign localized_tag_posts = site.tags[tag] | where: "lang", current_lang %}
    {% if localized_tag_posts.size > 0 %}
    <h2 id="{{- normalized_tag -}}" class="linked-section">
        <i class="fas fa-tag" aria-hidden="true"></i>
        &nbsp;{{- normalized_tag -}}&nbsp;({{localized_tag_posts.size}})
    </h2>
    <div class="post-list">
        {%- for post in localized_tag_posts -%}
            <div class="tag-entry">
                <a href="{{ post.url | relative_url }}">{{- post.title | strip_html -}}</a>
                <div class="entry-date">
                    <time datetime="{{- post.date | date_to_xmlschema -}}">{{- post.date | date: date_format -}}</time>
                </div>
            </div>
        {%- endfor -%}
    </div>
    {% endif %}
    {% endif %}
{%- endfor -%}
</div>
