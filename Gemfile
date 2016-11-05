source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'paypal-recurring',
    github: 'samuelsimoes/paypal-recurring',
    ref: '7dd39ffc001e2027ce5be1b908d419a312099006'

group :development, :test do
  gem 'rspec-rails', '3.1.0'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
