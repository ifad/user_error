module UserError
  class Engine < ::Rails::Engine
    isolate_namespace UserError

    engine_name :user_error

    initializer "user_error.install_app" do |app|
      app.config.exceptions_app = -> (env) do 
        ::UserError::ExceptionsController.action(:show).call(env)
      end
    end
  end
end
