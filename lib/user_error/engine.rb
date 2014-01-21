module UserError
  class Engine < ::Rails::Engine
    isolate_namespace UserError

    engine_name :user_error

    initializer "user_error.install_app" do |app|
      app.config.exceptions_app = ->(env) { ::UserError::ExceptionsController.action(:show).call(env) }
    end

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl,     dir: 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
