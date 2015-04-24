module Binco
  module BreadcrumbsHelper

    def breadcrumb
      @breadcrumb ||= [{ title: 'Home', url: root_path }]
    end

    def breadcrumb_add(options = {})
      breadcrumb << options
    end

    private

  end
end
