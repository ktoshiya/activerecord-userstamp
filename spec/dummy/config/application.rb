require File.expand_path('boot', __dir__)

require 'rails/all'

Bundler.require(*Rails.groups)
require "active_record/userstamp"

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks. This only applies to Rails 4.2
    # and is deprecated in Rail 5.
    config.active_record.raise_in_transactional_callbacks = true if ActiveRecord.version == Gem::Version.new('4.2.x')

    config.after_initialize do
      require_relative '../db/schema'
    end
  end
end
