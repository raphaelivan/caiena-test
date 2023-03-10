require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module CaienaTest
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = 'Brasilia'
    config.api_only = true


    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_config_env.yml')
      
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end
end
