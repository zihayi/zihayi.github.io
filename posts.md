---
layout: default
title: 文章
permalink: /posts/
---

<header class="page-heading">
  <h1>文章</h1>
  <p>工程实践、项目记录与一些可复用的思考。</p>
</header>

<section aria-labelledby="all-posts">
  <div class="section-heading">
    <h2 id="all-posts">全部文章</h2>
    <span class="section-meta">{{ site.posts.size }} 篇记录</span>
  </div>
{% if site.posts.size > 0 %}
<div class="entry-list">
{% for post in site.posts %}
{% include entry.html entry=post %}
{% endfor %}
</div>
{% else %}
<p class="empty-state">还没有文章，新的记录会出现在这里。</p>
{% endif %}
</section>
