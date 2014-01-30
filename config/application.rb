require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "bootstrap-sass"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

Moped::BSON = BSON

module Strasbourgstartups
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Paris'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.available_locales = [:en, :fr]
    config.i18n.default_locale = :en

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

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
