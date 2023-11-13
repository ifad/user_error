module UserError
  class ExceptionsController < ::ApplicationController

    helper do
        # sometimes user_error needs to look for routes in the main app
        # thanks @npj !!
        def method_missing(method, *args, &block)
          super unless method.to_s =~ /(_path|_url)\z/
          main_app.send(method, *args, &block)
        end
    end

    def show
      env = request.env
      @exception       = env['action_dispatch.exception']
      @status_code     = ActionDispatch::ExceptionWrapper.new(env, @exception).status_code
      @rescue_response = ActionDispatch::ExceptionWrapper.rescue_responses[@exception.class.name]

      if request.format.symbol.in?([nil, :html]) && env['REQUEST_URI'] =~ /\.(\w+)$/i
        # Try to infer the Mime type from the extension
        if (mime = Mime::Type.lookup_by_extension($1))
          request.format = mime.to_sym # Stupid.to_sym
        end
      end

      respond_to do |format|
        format.html {
          view = %{400 401 403 404 422 500}.include?(@status_code.to_s) ? @status_code.to_s : "show"

          render view, status: @status_code
        }
        format.json { render json: { error: details }, status: @status_code }
        format.xml  { render xml: details, root: "error", status: @status_code }
        format.all  { render plain: '', status: @status_code }
      end
    end

    protected

    def details
      @details ||= {}.tap do |h|
        I18n.with_options scope: [:exception, :show, @rescue_response],
                          exception_name: @exception.class.name,
                          exception_message: @exception.message do |i18n|
          h[:name]    = i18n.t "#{@exception.class.name.underscore}.title",       default: i18n.t(:title,       default: @exception.class.name)
          h[:message] = i18n.t "#{@exception.class.name.underscore}.description", default: i18n.t(:description, default: @exception.message)
          h[:status]  = @status_code
        end
      end
    end
    helper_method :details
  end
end
