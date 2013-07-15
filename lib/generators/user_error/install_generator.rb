module UserError
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      desc "Creates an user_error initializer to handle more exceptions."
      class_option :orm


      def copy_initializer
        template '../templates/initializer.rb', 'config/initializers/user_error.rb'
      end

      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

    end
  end
end
