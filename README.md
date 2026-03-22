# Engineering Perspective Blog

A minimal, clean, production-ready Jekyll blog for technical content on enterprise systems, architecture, and scalable engineering.

**Author**: Alexander Pankraz  
**Brand**: Engineering Perspective

## Stack

- **Jekyll**: Static site generator (Ruby-based)
- **Theme**: Minima (minimal Jekyll theme)
- **Analytics**: Cloudflare Web Analytics (placeholder integration)
- **Hosting**: GitHub Pages compatible
- **Content**: Markdown

## Features

- **Modern, responsive design**: Full-width layout on desktop, mobile-optimized
- **LinkedIn integration**: Social media link in header
- **Tag-based filtering**: Click tags to filter posts by topic
- **Introduction section**: Custom intro on homepage before recent posts
- **Profile photo**: Circular photo with shadow on about page
- **Sticky header**: Navigation always accessible
- **Gradient background**: Modern aesthetic with blue accent colors
- **Smooth transitions**: Hover effects and animations
- **No bloated dependencies**: Pure CSS for styling, vanilla JavaScript for filters

## Quick Start

### Option 1: Using Podman (Recommended - No Local Dependencies)

1. **Start the Jekyll container**:
   ```bash
   cd blog
   podman-compose up
   ```

2. **View the site**:
   Open http://localhost:4000 in your browser

The site will auto-rebuild when files change. Stop with `Ctrl+C`.

**Or with podman run directly:**
```bash
cd blog
podman run --rm -v "${PWD}:/srv/jekyll" -p 4000:4000 jekyll/jekyll jekyll serve --host 0.0.0.0
```

### Option 2: Local Installation (Ruby Required)

**Prerequisites:**
- Ruby 2.7 or higher
- Bundler

**Steps:**
1. Install dependencies:
   ```bash
   cd blog
   bundle install
   ```

2. Run the development server:
   ```bash
   bundle exec jekyll serve
   ```

3. View the site at http://localhost:4000

The site will auto-rebuild when files change.

## Project Structure

```
blog/
├── _posts/              # Blog posts (Markdown, YYYY-MM-DD-title.md format)
├── _layouts/            # HTML layout templates
│   ├── default.html     # Main layout
│   └── post.html        # Blog post layout
├── _includes/           # Reusable HTML components
├── assets/
│   ├── css/
│   │   └── style.css    # Minimal styling
│   └── images/          # Image assets
├── index.md             # Homepage
├── about.md             # About page
├── blog.md              # All posts list
├── _config.yml          # Jekyll configuration
├── Gemfile              # Ruby dependencies
└── README.md            # This file
```

## Pages

- **Home** (`/`): Introduction section + latest 5 posts
- **Blog** (`/blog/`): Complete post archive with clickable tag filtering
- **About** (`/about/`): Author bio and focus areas with profile photo
- **Posts** (`/blog/YYYY/MM/DD/post-title/`): Individual articles

## Writing Posts

Create a new file in `_posts/` with the format: `YYYY-MM-DD-title.md`

**Template**:
```markdown
---
layout: post
title: "Your Post Title"
date: 2024-03-19
tags: [tag1, tag2, tag3]
---

## Section Title

Your content here. Use markdown for formatting.

### Subsection

More content.
```

Posts are automatically sorted by date (newest first).

## Configuration

Edit `_config.yml` to customize:

- `title`: Site title
- `description`: Site description
- `author`: Author name
- `url`: Your GitHub Pages URL
- `baseurl`: Empty for root domain, `/blog` if subdirectory

## Analytics

To enable Cloudflare Web Analytics:

1. Get your Cloudflare token from [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Open `_layouts/default.html`
3. Find the commented Cloudflare script and uncomment it
4. Replace `INSERT_YOUR_TOKEN_HERE` with your token

## Deployment to GitHub Pages

### Option 1: Automatic (Recommended)

1. Push this repo to GitHub
2. Go to repo **Settings** → **Pages**
3. Set **Source** to `main` branch
4. GitHub will auto-build and deploy

### Option 2: Manual Deployment

1. Build the site locally:
   ```bash
   bundle exec jekyll build
   ```

2. The `_site/` folder contains the static HTML
3. Deploy `_site/` to your hosting

## Customization

### Styling

Edit `assets/css/style.css`:
- Main layout max-width: 800px
- Color scheme: adjust color values
- Typography: modify font families or sizes

### Layout

Customize `_layouts/default.html`:
- Modify header navigation links
- Add/remove footer content
- Update SEO tags
- Change LinkedIn profile URL (update `https://www.linkedin.com/in/alexander-pankraz-a9a6b152/`)

### Gemfile

To add plugins:
```ruby
gem "plugin-name"
```

Then run: `bundle install`

## Performance

- **Minimal CSS**: No CSS frameworks
- **No JavaScript frameworks**: Lightweight and fast
- **Static HTML**: Cached efficiently by CDNs
- **Optimized build**: ~50ms build time on typical project

## Troubleshooting

### With Podman

**Port 4000 already in use?**
```bash
podman-compose up --build -p 4001:4000
# or
podman run --rm -v "${PWD}:/srv/jekyll" -p 4001:4000 jekyll/jekyll jekyll serve --host 0.0.0.0
```

**Container won't start?**
```bash
podman pull jekyll/jekyll:latest
podman-compose up --build
```

**Permissions issues on Linux?**
```bash
# Run with user ID
podman unshare chown -R 1000:1000 .
```

### Local Install

**Port 4000 already in use?**
```bash
bundle exec jekyll serve --port 4001
```

**Build errors with plugins?**
```bash
bundle update
bundle exec jekyll serve
```

**Posts not showing?**
- Ensure date is in YYYY-MM-DD format
- Check filename follows: `YYYY-MM-DD-title.md`
- Verify `layout: post` in front matter

## Tech Stack Details

- **Jekyll 4.3+**: Core static site generator
- **Minima 2.5+**: Lightweight default theme
- **jekyll-feed**: Auto-generates RSS feed
- **jekyll-seo-tag**: SEO meta tag generation

## License

Content © 2024 Alexander Pankraz. Feel free to fork and customize for your own blog.

---

**Questions or improvements?** This project is designed to be a clean starting point for technical blogging on enterprise architecture and systems design.
