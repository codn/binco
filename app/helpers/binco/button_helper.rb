module Binco
  module ButtonHelper
    def button(title, options = {})
      options[:type] ||= :default
      options[:class] ||= ''
      options[:class] << ' ' if options[:class].length > 1
      options[:class] << "btn btn-#{options[:type]}"
      content_tag :button, title, options.except(:type)
    end

    def button_primary(title, options = {})
      options[:type] = :primary
      button(title, options)
    end

    def button_default(title, options = {})
      options[:type] = :default
      button(title, options)
    end

    def button_success(title, options = {})
      options[:type] = :default
      button(title, options)
    end

    def button_info(title, options = {})
      options[:type] = :info
      button(title, options)
    end

    def button_warning(title, options = {})
      options[:type] = :warning
      button(title, options)
    end

    def button_danger(title, options = {})
      options[:type] = :warning
      button(title, options)
    end
  end
end