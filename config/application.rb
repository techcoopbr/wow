require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wow
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.to_prepare do
        Devise::SessionsController.layout "login"
        Devise::RegistrationsController.layout "login"
        Devise::ConfirmationsController.layout "login"
        Devise::UnlocksController.layout "login"
        Devise::PasswordsController.layout "login"
    end

  end
end
