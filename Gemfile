# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.5'

gem 'puma', '>= 5.0'

gem 'figaro'

gem 'importmap-rails'

gem 'haml', '~> 6.3'

# dry-rb gems
gem 'dry-matcher', '~> 1.0'
gem 'dry-monads', '~> 1.6'
gem 'dry-validation', '~> 1.10'

# for JSON responce
gem 'blueprinter', '~> 1.0.2'
gem 'oj'

gem 'turbo-rails'

gem 'stimulus-rails'

# for file storage
gem 'shrine', '~> 3.6'

gem 'sidekiq', '~> 7.2'

gem 'redis', '>= 4.0.1'
# gem "kredis"

gem 'rack-cors'

gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.9'
gem 'jwt', '~> 2.8'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false

# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.3'
  gem 'rspec-rails', '~> 6.1'
end

group :development do
  gem 'html2haml'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'solargraph', require: false
  gem 'web-console'
end
