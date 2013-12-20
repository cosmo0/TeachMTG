source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails',                  '3.2.13'

gem 'haml',                   '~> 4.0.3'
gem 'bluecloth',              '~> 2.2.0'
gem 'friendly_id',            '~> 4.0.9'
gem 'devise',                 '~> 3.0.3'
gem 'omniauth-google-oauth2', '~> 0.2.1'
gem 'pg',                     '~> 0.12.2'
gem 'bootstrap-sass',         '~> 2.3.2'
gem 'jquery-rails',           '~> 2.0.2'

group :development do
  gem 'foreman',              '~> 0.63.0'

  gem 'haml-rails',           '~> 0.4'
  gem 'html2haml',            '~> 1.0.1'

  gem 'rspec-rails',          '~> 2.14.0'
  gem 'guard-rspec',          '~> 3.0.2'

  gem 'therubyracer', platforms: :ruby
  gem 'sextant',              '~> 0.2.4'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',           '~> 3.2.5'
  gem 'coffee-rails',         '~> 3.2.2'
  gem 'uglifier',             '~> 2.2.1'
end

group :test do
  gem 'capybara',             '~> 1.1.4'
  gem 'factory_girl_rails',   '~> 4.2.1'

  # test gems on OSX
  gem 'rb-fsevent',          '0.9.3', :require => false
  gem 'growl',               '1.0.3'

  # test gems on Linux
  #gem 'rb-inotify',           '~> 0.9.0'
  #gem 'libnotify',            '~> 0.8.1'
  #gem 'ffi',                  '~> 1.9.0'

  # test gems on Windows
  #gem 'wdm',                 '0.1.0'
  #gem 'rb-notifu',           '0.0.4'
  #gem 'win32console',        '1.3.0'
end

group :development, :test do
  gem 'guard-spork',          '~> 1.5.1'
  gem 'childprocess',         '~> 0.3.9'
  gem 'spork',                '~> 0.9.2'
end

group :production do
  gem 'unicorn'

  # Heroku
  gem 'newrelic_rpm'
end
