# Jekyll Blog Setup for Fedora

Your system is experiencing memory protection (RELRO) issues with containers. 

## Solution: Install Ruby Locally (Simpler on Fedora)

Instead of containers, install Ruby directly on your system:

### 1. Install Ruby and dependencies
```bash
sudo dnf install ruby ruby-devel gcc g++ make
```

### 2. Install Bundler
```bash
gem install bundler
```

### 3. Install gem dependencies
```bash
cd /mnt/data/DEV/github-blog/blog
bundle install
```

### 4. Run Jekyll
```bash
bundle exec jekyll serve
```

Then visit: http://localhost:4000

---

## Why not containers?

Your Fedora system has kernel-level RELRO (Read-Only Relocation) memory protections that are incompatible with how containers try to execute. This prevents any container image from running properly.

The local install approach is actually simpler and faster for development on Fedora.

---

## If you absolutely need containerization...

Contact your system administrator to relax RELRO protections, or use a different host environment (WSL2, macOS, etc.).
