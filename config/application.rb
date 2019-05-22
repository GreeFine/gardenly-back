# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gardenly
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.action_cable.allowed_request_origins = ['https://greefine.ovh']

    config.middleware.insert_before 0, Rack::Cors do
          allow do
            origins ENV.fetch("HOST_ADR", "localhost:3000")
            resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
          end
        end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
