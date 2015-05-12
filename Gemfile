source 'https://rubygems.org'
ruby "2.1.5"

gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'puma'

gem 'dropbox-sdk', '~> 1.6.4', require: 'dropbox_sdk'
gem 'attr_encrypted'
gem 'scrolls'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'foreman'
  gem 'spring'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
end
