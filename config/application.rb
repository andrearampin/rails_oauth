# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PaymasterOauth
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # example: bdfe2ffad2c6e5f5e19637ee8ceb46bf1c913e2
    # config.client_id =
    # '4cd7e56a696153f87157d52eb641613e6612b43727afdc0810816b2c369b167c'
    config.client_id = '32fefc2f17efff9736f9cea138e06265209dc5ea10e0b2331452d7620bd0cd55'

    # example: bdfe2ffad2c6e5f5e19637ee8ceb46bf1c913e2
    # config.client_secret =
    # 'f690225d92cb9399ea90f1d3df21ec8e3c91e504919a8305716dc126bba3ac70'
    config.client_secret = '4066af80ebc705820b4c329998f902eec3626de44ebbd63531f19cd3663da6e9'

    # example: Pfny90c3gTSEhzPyHigVjA
    config.web_token = 'Pfny90c3gTSEhzPyHigVjA'

    # example: sadjhASDfga234rASDferugic
    config.data_token = '4066af80ebc705820b4c329998f902eec3626de44ebbd63531f19cd3663da6e94066af80ebc705820b4c329998f902eec3626de44ebbd63531f19cd3663da6e9'

    # example: http://lvh.me:3001/oauth/callback
    config.redirect_uri = 'http://localhost:3001/oauth/callback'

    # example: https://staging.airtax.com.au (OAuth provider)
    config.site = 'http://localhost:3000'
  end
end
