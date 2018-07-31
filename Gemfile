source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
gem 'rails-i18n'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'haml'
gem 'mongoid'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'mongoid-slug', github: 'Fudoshiki/mongoid-slug'
gem 'geocoder'
gem 'mongoid-simple-tags'

gem 'devise'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'

gem 'simple_form'
gem 'will_paginate'
gem 'will_paginate_mongoid'
gem 'will_paginate-bootstrap4'

gem 'recaptcha', require: 'recaptcha/rails'

gem 'rollbar'
gem 'mailjet'
gem 'asset_sync'
gem 'fog-aws'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
