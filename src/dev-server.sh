#!/bin/bash

# Start the server
gem install bundler
bundle install
bundle exec jekyll serve --host 0.0.0.0 --livereload