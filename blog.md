---
layout: default
title: Blog
---

# All Posts

<div class="tag-filter">
  <span class="tag-filter-label">Filter by tag:</span>
  <button class="tag-filter-item active" onclick="filterPosts('all')">All</button>
  {% assign tags = site.posts | map: "tags" | join: "|" | split: "|" | uniq | sort %}
  {% for tag in tags %}
    <button class="tag-filter-item" onclick="filterPosts('{{ tag | downcase | replace: ' ', '-' }}')">{{ tag }}</button>
  {% endfor %}
</div>

<div id="posts-container">
  {% assign sorted_posts = site.posts | sort: "date" | reverse %}
  {% for post in sorted_posts %}
    <article class="post-item" data-tags="{% for tag in post.tags %}{{ tag | downcase | replace: ' ', '-' }}|{% endfor %}">
      <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
      <p class="posts-list-date">{{ post.date | date: "%B %d, %Y" }}</p>
      {% if post.tags %}
        <div class="post-tags">
          {% for tag in post.tags %}
            <span class="tag" onclick="filterPosts('{{ tag | downcase | replace: ' ', '-' }}')">{{ tag }}</span>
          {% endfor %}
        </div>
      {% endif %}
    </article>
  {% endfor %}
</div>

<script>
function filterPosts(tag) {
  const posts = document.querySelectorAll('.post-item');
  const buttons = document.querySelectorAll('.tag-filter-item');
  
  // Update active button
  buttons.forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
  
  // Filter posts
  posts.forEach(post => {
    const postTags = post.getAttribute('data-tags').split('|').filter(t => t);
    
    if (tag === 'all') {
      post.style.display = '';
    } else if (postTags.includes(tag)) {
      post.style.display = '';
    } else {
      post.style.display = 'none';
    }
  });
}
</script>
