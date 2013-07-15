module UserError
  class Engine < ::Rails::Engine

    initializer "user_error.install_app" do |app|
      app.config.exceptions_app = ->(env) { ::UserError::ExceptionsController.action(:show).call(env) }

      app.config.action_dispatch.rescue_responses["ActionController::RoutingError"] = :not_found
      app.config.action_dispatch.rescue_responses["CanCan::AccessDenied"] = :forbidden
    end

  end
end
