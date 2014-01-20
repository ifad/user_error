module UserError
  class Engine < ::Rails::Engine
    engine_name :user_error

    initializer "user_error.install_app" do |app|
      app.config.exceptions_app = ->(env) { ::UserError::ExceptionsController.action(:show).call(env) }
    end

  end
end
