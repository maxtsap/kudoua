source 'http://rubygems.org'

# gem 'rails', '3.0.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'mysql'
# gem 'sqlite3'
gem "jquery-rails"
gem 'sass'
gem 'refinerycms-news'
gem 'refinerycms-galleries', '= 0.4', :require => 'galleries', :git => 'git://github.com/Vizzuality/refinerycms-galleries.git'
gem 'refinerycms-image-gallery', :git => 'git://github.com/ginga/refinerycms-image-gallery.git'
# gem 'fog'
gem 'refinerycms-page-images'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================
# Anything you put in here will be overridden when the app gets updated.

gem 'refinerycms',              '~> 1.0.9'

group :development do
  gem 'thin'
  gem 'capistrano'
end

group :development, :test do
  # To use refinerycms-testing, uncomment it (if it's commented out) and run 'bundle install'
  # Then, run 'rails generate refinerycms_testing' which will copy its support files.
  # Finally, run 'rake' to run the tests.
  # gem 'refinerycms-testing',    '~> 1.0.8'

end

# END REFINERY CMS ============================================================

# USER DEFINED


# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-inquiries',    '~> 1.0'
# gem "refinerycms-news",         '~> 1.2'
# gem 'refinerycms-blog',         '~> 1.6'
# gem 'refinerycms-page-images',  '~> 1.0'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 1.0.0'
#gem 'refinerycms-banners', '1.0.1', :path => 'vendor/engines'

# END USER DEFINED


gem 'refinerycms-banners', '1.0', :path => 'vendor/engines'