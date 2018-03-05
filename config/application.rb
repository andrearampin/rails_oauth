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
    config.client_id = '92027ad0fbe62b62b8cf8f4b29eaf624864ff348405795922ae80de64aa458ec'

    # example: bdfe2ffad2c6e5f5e19637ee8ceb46bf1c913e2
    config.client_secret = '6c824621901bafca772be64d6749ba7c2c5f64c51f1e83ae4498f86cd692faaf'

    # example: Pfny90c3gTSEhzPyHigVjA
    config.web_token = 'Pfny90c3gTSEhzPyHigVjA'

    # example: sadjhASDfga234rASDferugic
    config.data_token = 'NmZlMDhlN2FmMzM3NDIzYZymNgtwQW15VDC5pk3u8mQnmIjGIyp3YSSVQoK9PjwK4R2-KdTqBzB7cX0RYI0E3EWtWmaFgYQq5omt0WxHozOLHcYuz99SHrtiC465kHp'

    # example: http://lvh.me:3001/oauth/callback
    config.redirect_uri = 'http://localhost:3001/oauth/callback'

    # example: https://staging.airtax.com.au (OAuth provider)
    config.site = 'http://localhost:3000/'
  end
end
