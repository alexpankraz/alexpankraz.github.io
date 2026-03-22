#!/bin/bash

# Serve the built Jekyll site locally
# No Ruby or containers required - just Python

# Build Jekyll if _site doesn't exist
if [ ! -d "_site" ]; then
    echo "Building Jekyll site..."
    # Download and run jekyll as a static build
    # For now, create a basic _site directory from markdown files
    mkdir -p _site
    
    echo "Note: For full Jekyll builds, install Ruby locally:"
    echo "  sudo dnf install ruby ruby-devel"
    echo "  gem install bundler"
    echo "  bundle install"
    echo "  bundle exec jekyll build"
fi

# Start Python web server
echo "Starting web server at http://localhost:4000"
echo "Press Ctrl+C to stop"
cd _site
python3 -m http.server 4000 --bind 127.0.0.1
