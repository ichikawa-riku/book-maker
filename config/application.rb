require_relative 'boot'

require 'rails/all'
require 'devise'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookMaker
  class Application < Rails::Application
    config.i18n.default_locale = :ja
  end
end
