require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
require "user_error"

module Dummy
  class Exception < StandardError; end

  class Application < Rails::Application; end
end

