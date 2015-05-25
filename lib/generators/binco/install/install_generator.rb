require 'rails/generators/active_record'
module Binco
  class InstallGenerator < Rails::Generators::Base
    desc 'Install bootstrap into your app'
    source_root File.expand_path("../templates", __FILE__)

    def create_application_scss
      copy_file 'stylesheet.scss', 'app/assets/stylesheets/application.scss'
    end

    def remove_file
      run 'rm app/assets/stylesheets/application.css'
    end

    def create_overrides
      copy_file '_bootstrap-variables.scss', 'app/assets/stylesheets/_bootstrap-variables.scss'
    end

  end
end
