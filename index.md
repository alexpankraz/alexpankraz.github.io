---
layout: default
title: Engineering Perspective
---

<div class="introduction">
<h2>Building connected systems at scale—where graphs, data, and AI meet.</h2>
<p>I write about building and operating systems at scale—covering architecture, data systems, and the patterns that make complex systems work in practice.</p>

<p>While a lot of my work focuses on graph technologies and their role in modern AI systems, this blog also includes a broader mix of technical content: architectural deep dives, practical lessons, experiments, and observations from working on real-world systems.

The goal is to share ideas and insights that are grounded in practice around designing systems that are scalable, understandable, and valuable</p>
</div>

## Recent Posts

{% assign sorted_posts = site.posts | sort: "date" | reverse | limit: 5 %}
{% for post in sorted_posts %}
<article class="post-preview">
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p class="posts-list-date">{{ post.date | date: "%B %d, %Y" }}</p>
  <p class="preview-text">{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
  {% if post.tags %}
    <div class="post-tags">
      {% for tag in post.tags %}
        <span class="tag">{{ tag }}</span>
      {% endfor %}
    </div>
  {% endif %}
  <a href="{{ post.url | relative_url }}" class="read-more">Read more →</a>
</article>
{% endfor %}

[View all posts →]({{ '/blog/' | relative_url }})
