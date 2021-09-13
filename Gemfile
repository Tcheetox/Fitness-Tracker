source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# gem 'mysql2', '>= 0.4.4' (AUTOMATICALLY ADDED)
gem 'mysql2', '~> 0.5.3'
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0' # gem 'therubyracer', platforms: :ruby
gem 'devise'
gem 'bootstrap', '~> 4.5'
gem 'jquery-rails'
gem 'chartkick'
gem 'groupdate'
gem 'twilio-ruby'
gem 'webpacker'

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5' # gem 'bcrypt', '~> 3.1.7'
# gem 'rest-client', '~> 2.1'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
#gem 'bootsnap', '>= 1.4.2', require: false

# group :development, :test do
# Call 'byebug' anywhere in the code to stop execution and get a debugger console
# gem 'byebug', platforms: %i[mri mingw x64_mingw] # Adds support for Capybara system testing and selenium driver
# gem 'capybara', '~> 2.13'
# gem 'selenium-webdriver'
# end

#group :development do
# Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
# gem 'web-console', '>= 3.3.0'
#end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
