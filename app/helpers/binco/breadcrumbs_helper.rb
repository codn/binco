module Binco
  module BreadcrumbsHelper

    def breadcrumb_default
      @breadcrumb = []
      if Binco.breadcrumb_before
        @breadcrumb << Binco.breadcrumb_before
      end
      if Binco.breadcrumb_default
        Binco.breadcrumb_default.each do |member|
          @breadcrumb << { title: member[:title], url: member[:url] }
        end
      end
      @breadcrumb
    end

    def breadcrumb
      @breadcrumb ||= breadcrumb_default
    end

    def breadcrumb_add(options = {})
      breadcrumb << options
    end

    private

  end
end
