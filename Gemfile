# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.5', '>= 6.0.5.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# ---------------------------------------
# User authentication
gem 'devise', '~> 4.8', '>= 4.8.1'
# For BDD testing
gem 'rspec', '~> 3.11'
# Carrier Wave for file uploading
gem 'carrierwave', '~> 2.0'
gem 'mini_magick'
# gem 'fog'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'pg', '~> 1.4', '>= 1.4.3'

# Sidekiq uses threads to handle many jobs at the same time in the same process
gem 'sidekiq', '~> 6.1.3'

gem 'nifty-generators', group: :development

gem 'graphviz', '~> 1.2', '>= 1.2.1'
gem 'rails-erd', group: :development

# For active admin functionality
gem 'activeadmin'

# Simple authorization solution for Rails. All permissions are stored in a single location.
gem 'cancancan', '~> 3.4'

# RuboCop is a Ruby code style checking and code formatting tool. It aims to enforce the community-driven Ruby Style Guide.
gem 'rubocop', '~> 1.36'

# Rails community to implement advanced search capability in a Ruby on Rails application
gem 'ransack'




# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'mocha', group: :test

gem 'turbo-rails', '~> 1.1'

gem 'stimulus-rails', '~> 1.1'
