source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.3.4'

gem 'rails', '~> 7.0.8', '>= 7.0.8.4'
gem 'sprockets-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'activerecord-import'
gem 'kaminari'
gem 'turbo-rails'
gem 'bigdecimal'
gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem "dockerfile-rails", ">= 1.6", :group => :development
