source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


gem 'pg'
gem 'devise'
gem 'simple_form', :github => 'plataformatec/simple_form'
gem 'country_select'
gem "nested_form"
gem 'kaminari'
gem 'bootstrap-kaminari-views'
# gem 'carrierwave'
gem 'rmagick', '2.13.2'
gem "haml-rails"
gem "twitter-bootstrap-rails"
gem 'validates_timeliness'
gem 'bootstrap-datepicker-rails'
gem 'client_side_validations', :github => 'bcardarella/client_side_validations', branch: '4-0-beta'
gem 'client_side_validations-simple_form', :github => 'saveritemedical/client_side_validations-simple_form'
gem 'has_scope'

gem 'faker'
gem "workless"

#Location
# gem "geocoder"

gem "ransack" #search gem

#validation URL
gem "validate_url"

group :test, :development do
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
end

group :development do
  gem 'pry-rails'
  gem "better_errors"
  gem 'quiet_assets'
  gem 'html2haml'
  gem 'rails-erd'
  gem 'hirb'
  gem 'annotate', ">=2.5.0"

  # Deploy with to heroku
  gem 'heroku_san'
end

group :test do
  gem 'factory_girl_rails'
  gem "capybara"
  gem 'shoulda-matchers'
  gem "database_cleaner"
  gem "email_spec"
  gem "json_spec"
  gem 'simplecov'
  gem 'headless'
end