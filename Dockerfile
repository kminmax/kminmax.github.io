FROM ruby:3.1

WORKDIR /site

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Copy Gemfile and install gems
COPY Gemfile* ./
RUN bundle install

# Copy site files
COPY . .

# Expose port
EXPOSE 4000

# Start Jekyll server with hot reload, config reload, and incremental builds
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload", "--incremental", "--watch", "--force_polling", "--livereload-ignore", "_site/*"]