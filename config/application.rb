require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StrasbourgStartups
  class Application < Rails::Application
    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 '/about',  '/a-propos'
      r301 '/admin',  '/extranet'
      r301 '/admin/*',  '/extranet/$1'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Paris'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.available_locales = [:fr, :en]
    config.i18n.default_locale = :fr

    config.paperclip_defaults = {
      :storage => :fog,
      :fog_credentials => {
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
        :provider => ENV['FOG_PROVIDER'],
        :region =>  ENV['FOG_REGION']
      },
      :fog_directory => ENV['FOG_DIRECTORY'],
      :fog_file => {'Cache-Control' => 'max-age=315576000', 'Expires' => 1.years.from_now.httpdate},
      :fog_host => ENV['FOG_HOST'].present? ? ENV['FOG_HOST'] : "http://#{ ENV['FOG_DIRECTORY'] }.s3.amazonaws.com",
      :fog_public => true
    }

    config.to_prepare do
      Devise::SessionsController.layout "admin"
    end
  end
end
