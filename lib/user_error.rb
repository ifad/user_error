require "user_error/engine"

module UserError
  autoload :DSL, 'user_error/dsl'

  def self.configure(&block)
    DSL.instance_eval(&block)
  end

end
