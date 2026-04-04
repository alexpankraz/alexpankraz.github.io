---
layout: default
title: Engineering Perspective 
---

<div class="hero-grid">
  <img src="{{ site.baseurl }}/assets/images/profile.jpg" alt="Alex Pankraz" class="profile-photo-small">
  
  <div class="hero-content">
    <h1 class="hero-name">Alex Pankraz <span class="hero-role">| Engineer & Architect</span></h1>
    <p class="hero-bio">
      Building connected systems  where <strong>Graphs, Data, and AI</strong> meet in enterprise environments. 
      Focused on pragmatic architecture and translating complex requirements into resilient strategies.
    </p>
  </div>
</div>

<hr class="slim-divider">

<section class="recent-posts">
  <h2 class="section-heading">Recent Insights</h2>

  {% assign sorted_posts = site.posts | sort: "date" | reverse | limit: 5 %}
  {% for post in sorted_posts %}
  <article class="post-compact">
    <div class="post-stats">
      <span class="date">{{ post.date | date: "%b %d, %y" }}</span>
    </div>
    <div class="post-details">
      <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
      <p>{{ post.excerpt | strip_html | truncatewords: 15 }}</p>
    </div>
  </article>
  {% endfor %}
</section>
