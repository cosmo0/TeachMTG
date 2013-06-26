source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

group :development do
  gem 'pg', '0.12.2'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'

  # test gems on OSX
  #gem 'rb-fsevent', '0.9.1', :require => false
  #gem 'growl', '1.0.3'

  # test gems on Linux
  #gem 'rb-inotify', '0.8.8'
  #gem 'libnotify', '0.5.9'

  # test gems on Windows
  gem 'rb-fchange', '0.0.5'
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.0'
end

group :development, :test do
  gem 'guard-spork', '1.2.0'
  gem 'childprocess', '0.3.9'
  gem 'spork', '0.9.2'
end

group :production do
  gem 'pg', '0.12.2'
  gem 'unicorn'
end

gem 'jquery-rails', '2.0.2'
