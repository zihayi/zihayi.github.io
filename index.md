---
layout: default
title: 首页
---

<header class="home-intro">
  <h1>日日渐进，<wbr>必有所得。</h1>
  <p>记录工程实践、技术笔记，<br class="intro-break">和一些可复用的思考。</p>
</header>

<section class="home-section" aria-labelledby="latest-posts">
  <div class="section-heading">
    <h2 id="latest-posts">最新文章</h2>
    <a class="section-link" href="{{ '/posts/' | relative_url }}">全部文章 <span class="entry-count">{{ site.posts.size }}</span></a>
  </div>
  {% if site.posts.size > 0 %}
  <div class="entry-list">
    {% for post in site.posts limit:5 %}
    {% include entry.html entry=post %}
    {% endfor %}
  </div>
  {% else %}
  <p class="empty-state">还没有文章，新的记录会出现在这里。</p>
  {% endif %}
</section>

<section class="home-section" aria-labelledby="latest-notes">
  <div class="section-heading">
    <h2 id="latest-notes">最近笔记</h2>
    <a class="section-link" href="{{ '/notes/' | relative_url }}">全部笔记 <span class="entry-count">{{ site.notes.size }}</span></a>
  </div>
{% assign latest_notes = site.notes | sort: "date" | reverse %}
  {% if latest_notes.size > 0 %}
  <div class="entry-list">
    {% for note in latest_notes limit:5 %}
    {% include entry.html entry=note %}
    {% endfor %}
  </div>
  {% else %}
  <p class="empty-state">还没有笔记，随手记下的想法会放在这里。</p>
  {% endif %}
</section>
