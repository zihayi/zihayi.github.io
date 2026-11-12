---
layout: default
title: 笔记
permalink: /notes/
---

<header class="page-heading">
  <h1>笔记</h1>
  <p>随手记下的命令、排错过程和小结。</p>
</header>

<section aria-labelledby="all-notes">
  <div class="section-heading">
    <h2 id="all-notes">全部笔记</h2>
    <span class="section-meta">{{ site.notes.size }} 则记录</span>
  </div>
{% assign all_notes = site.notes | sort: "date" | reverse %}
{% if all_notes.size > 0 %}
<div class="entry-list">
{% for note in all_notes %}
{% include entry.html entry=note %}
{% endfor %}
</div>
{% else %}
<p class="empty-state">还没有笔记，随手记下的想法会放在这里。</p>
{% endif %}
</section>
