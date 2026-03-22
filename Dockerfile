FROM jekyll/jekyll:latest

WORKDIR /srv/jekyll

# Copy Gemfile and install dependencies
COPY Gemfile* ./
RUN bundle install

# Expose port
EXPOSE 4000

# Default command
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
