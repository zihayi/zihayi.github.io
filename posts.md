---
layout: default
title: Posts
permalink: /posts/
---

# 文章

{% if site.posts.size > 0 %}
{% for post in site.posts %}
<article class="list-item">
  <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  <time>{{ post.date | date: "%Y-%m-%d" }}</time>
  {% if post.description %}<p>{{ post.description }}</p>{% endif %}
</article>
{% endfor %}
{% else %}
暂无文章。
{% endif %}
