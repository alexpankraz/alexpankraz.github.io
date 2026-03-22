---
layout: default
title: Tags
---

# Browse by Tag

<div class="tag-filter">
  <span class="tag-filter-label">Filter posts:</span>
  <a href="#" class="tag-filter-item active" data-tag="all">All</a>
  {% assign tags = site.posts | map: "tags" | join: "|" | split: "|" | uniq | sort %}
  {% for tag in tags %}
    <a href="#" class="tag-filter-item" data-tag="{{ tag | downcase }}">{{ tag }}</a>
  {% endfor %}
</div>

<div id="posts-container">
  {% assign sorted_posts = site.posts | sort: "date" | reverse %}
  {% for post in sorted_posts %}
    <article class="post-item" data-tags="{{ post.tags | map: 'downcase' | join: ' ' }}">
      <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
      <p class="posts-list-date">{{ post.date | date: "%B %d, %Y" }}</p>
      <p>{{ post.excerpt | strip_html | truncatewords: 20 }}</p>
      <div class="post-tags">
        {% for tag in post.tags %}
          <a href="#" class="tag" data-tag="{{ tag | downcase }}">{{ tag }}</a>
        {% endfor %}
      </div>
    </article>
  {% endfor %}
</div>

<script>
  document.querySelectorAll('.tag-filter-item').forEach(button => {
    button.addEventListener('click', function(e) {
      e.preventDefault();
      
      const selectedTag = this.dataset.tag.toLowerCase();
      const posts = document.querySelectorAll('.post-item');
      
      // Update active state
      document.querySelectorAll('.tag-filter-item').forEach(btn => {
        btn.classList.remove('active');
      });
      this.classList.add('active');
      
      // Filter posts
      posts.forEach(post => {
        if (selectedTag === 'all') {
          post.style.display = '';
        } else {
          const tags = post.dataset.tags.split(' ');
          if (tags.includes(selectedTag)) {
            post.style.display = '';
          } else {
            post.style.display = 'none';
          }
        }
      });
    });
  });

  document.querySelectorAll('.tag').forEach(tag => {
    tag.addEventListener('click', function(e) {
      e.preventDefault();
      const tagName = this.dataset.tag;
      const filterButton = document.querySelector(`[data-tag="${tagName}"]`);
      if (filterButton && filterButton !== this) {
        filterButton.click();
      }
    });
  });
</script>
