module UserError

  module DSL
    extend self

    def rescue_from(exception, options)
      if exception.class == Class
        exception = exception.name
      end

      action = options.fetch(:with, nil)

      if action.nil?
        raise Error, "Invalid action given for `#{exception}'"
      end

      rescue_responses.each {|map| map[exception] = action }
    end

    def controller(&block)
      ::UserError::ExceptionsController.instance_eval(&block)
    end

    private
      def rescue_responses
        [app_rescue_responses, exception_wrapper_rescue_responses]
      end

      def app_rescue_responses
        Rails.application.config.action_dispatch.rescue_responses
      end

      def exception_wrapper_rescue_responses
        ActionDispatch::ExceptionWrapper.rescue_responses
      end

  end

end
