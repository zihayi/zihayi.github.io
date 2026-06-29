---
layout: default
title: Notes
permalink: /notes/
---

# 笔记

{% assign all_notes = site.notes | sort: "date" | reverse %}
{% if all_notes.size > 0 %}
{% for note in all_notes %}
<article class="list-item">
  <a href="{{ note.url | relative_url }}">{{ note.title }}</a>
  {% if note.date %}<time>{{ note.date | date: "%Y-%m-%d" }}</time>{% endif %}
  {% if note.description %}<p>{{ note.description }}</p>{% endif %}
</article>
{% endfor %}
{% else %}
暂无笔记。
{% endif %}
