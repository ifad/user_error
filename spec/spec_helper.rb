ENV["RAILS_ENV"] ||= 'production'
require File.expand_path("../dummy/config/environment", __FILE__)
require File.expand_path("../../lib/user_error", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
end
