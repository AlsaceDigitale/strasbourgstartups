require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Strasbourgstartups
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Paris'

    config.generators do |g|
      g.orm :active_record
    end

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.available_locales = [:fr, :en]
    config.i18n.default_locale = :fr

    config.active_storage.content_types_to_serve_as_binary -= ['image/svg+xml']

    config.paperclip_defaults = {
      storage: :fog,
      fog_credentials: {
      aws_access_key_id: ENV['S3_KEY'],
        aws_secret_access_key: ENV['S3_SECRET'],
        provider: ENV['FOG_PROVIDER'],
        region:  ENV['S3_REGION']
      },
      fog_directory: ENV['S3_BUCKET_NAME'],
      fog_file: {'Cache-Control' => 'max-age=315576000', 'Expires' => 1.years.from_now.httpdate},
      fog_host: ENV['FOG_HOST'].present? ? ENV['FOG_HOST'] : "https://#{ ENV['S3_BUCKET_NAME'] }.s3.amazonaws.com",
      fog_public: true
    }

    config.to_prepare do
      Devise::SessionsController.layout  "admin"
      Devise::PasswordsController.layout "admin"
      Devise::ConfirmationsController.layout "admin"
    end

    # Setup HSTS to ensure https
    if Rails.env.production?
      config.public_file_server.headers = {
        'Cache-Control' => "max-age=#{ 1.week.to_i }",
        'Expires' => 1.week.from_now.httpdate
      }

      config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
        r301 '/about',  '/a-propos'
        r301 '/admin',  '/extranet'
        r301 '/admin/',  '/extranet/'
        r301 '/admin/*',  '/extranet/$1'
      end

      AssetSync.configure do |config|
        # Disable automatic run on precompile in order to attach to webpacker rake task
        config.run_on_precompile = false
        # The block should return an array of file paths
        config.add_local_file_paths do
          # Support webpacker assets
          public_root = Rails.root.join("public")
          Dir.chdir(public_root) do
            packs_dir = Webpacker.config.public_output_path.relative_path_from(public_root)
            Dir[File.join(packs_dir, '/**/**')]
          end
        end
      end

      config.force_ssl = true
      config.ssl_options = { hsts: { subdomains: false, preload: true, expires: 1.year } }
    end
  end
end
