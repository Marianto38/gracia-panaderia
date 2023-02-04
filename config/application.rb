require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GraciaPanaderia
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false

      # config.active_job.queue_adapters = :delayed_job

      # config.action_mailer.default_url_options = {host: 'example.com'}

      # config.action_mailer.delivery_method = :smtp
      # config.action_mailer.smtp_settings = {
      #   address: 'localhost',
      #   port: 1025
      # }
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.to_prepare do
      Devise::SessionsController.layout "pages"
      Devise::RegistrationsController.layout proc { user_signed_in? ? "application" : "pages" }
      Devise::ConfirmationsController.layout "pages"
      Devise::UnlocksController.layout "pages"
      Devise::PasswordsController.layout "pages"
    end

  end
end
