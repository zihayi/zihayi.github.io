---
layout: default
title: Home
---

# Personal Tech Blog

记录工程实践、技术笔记和一些可复用的思考。

<section class="hero-card">
  <p class="eyebrow">Latest</p>
  <h2>保持简洁，持续沉淀。</h2>
  <p>文章适合完整主题，笔记适合短记录、命令片段、排错过程和阅读摘要。</p>
</section>

## 最新文章

{% if site.posts.size > 0 %}
{% for post in site.posts limit:5 %}
- [{{ post.title }}]({{ post.url | relative_url }}) · {{ post.date | date: "%Y-%m-%d" }}
{% endfor %}
{% else %}
暂无文章。
{% endif %}

[查看全部文章]({{ "/posts/" | relative_url }})

## 最新笔记

{% assign latest_notes = site.notes | sort: "date" | reverse %}
{% if latest_notes.size > 0 %}
{% for note in latest_notes limit:5 %}
- [{{ note.title }}]({{ note.url | relative_url }}){% if note.date %} · {{ note.date | date: "%Y-%m-%d" }}{% endif %}
{% endfor %}
{% else %}
暂无笔记。
{% endif %}

[查看全部笔记]({{ "/notes/" | relative_url }})
