source 'https://rubygems.org'

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'rails-i18n'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'haml'
gem 'mongoid'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'mongoid-slug'
gem 'devise'
gem 'devise_invitable', github: 'scambra/devise_invitable'
gem 'devise-i18n-views'
gem 'fog-aws'
gem 'fog', require: 'fog/aws/storage'
gem 'paperclip'
gem 'will_paginate'
gem 'will_paginate_mongoid'
gem 'geocoder'
gem 'mongoid-simple-tags'
gem 'acts_as_list'
gem 'rollbar'
gem 'ckeditor'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'will_paginate-bootstrap4'
gem 'bootstrap'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
gem 'font-awesome-rails'
gem 'responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'simple_form'
gem 'nested_form', github: 'ryanb/nested_form'

gem 'rack-rewrite'
gem 'mailjet'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'pry-rails'
  gem 'pry-nav'
  gem 'dotenv-rails'
  gem 'scalingo_databases_rake_tasks', github: 'Scalingo/scalingo_databases_rake_tasks-gem'
end

group :production do
  gem 'asset_sync'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
