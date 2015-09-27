source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'

# Use SCSS for stylesheets
gem 'sass-rails',     '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.5'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# gem 'therubyracer', platforms: :ruby

gem 'clearance', '~> 1.11.0'

gem 'jquery-rails'

gem 'font-awesome-sass'

group :production do
  gem 'passenger', '~> 5.0.20'
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'mailcatcher', '~> 0.6.1'
end

group :test do
  gem 'rspec-rails', '~> 3.3.3'
  gem 'guard-rspec', require: false
  gem 'factory_girl', '~> 4.5.0'
  gem 'capybara'    , '~> 2.5.0'
  gem 'coveralls', require: false
end
