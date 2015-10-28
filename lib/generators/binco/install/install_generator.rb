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
      copy_file '_bootstrap_variables.scss', 'app/assets/stylesheets/_bootstrap_variables.scss'
    end

    def add_javascripts
      inject_into_file 'app/assets/javascripts/application.js', after: '//= require turbolinks' do
        "\n//= require binco\n" +
        "//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js\n" +
        "//= require select2_locale_es"
      end
    end
  end
end
