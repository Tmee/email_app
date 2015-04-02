require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module UserEmail
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              'smtp.mandrillapp.com',
      port:                 '587',
      user_name:            'tjmee90@gmail.com',
      password:             ENV["mandrill_key"],
      authentication:       'plain',
      enable_starttls_auto: true
    }
    config.active_record.raise_in_transactional_callbacks = true
  end
end
