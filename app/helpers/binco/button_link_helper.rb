module Binco
  module ButtonLinkHelper
    def button_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] ||= :default
      html_options[:class] ||= ''
      html_options[:class] << ' ' if html_options[:class].length > 1
      html_options[:class] << "btn btn-#{html_options[:type]}"
      link_to(name, options, html_options.except(:type), &block)
    end

    def button_primary_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] = :primary
      button_link_to(name, options, html_options, &block)
    end

    def button_default_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] = :default
      button_link_to(name, options, html_options, &block)
    end

    def button_danger_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] = :danger
      button_link_to(name, options, html_options, &block)
    end

    def button_warning_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] = :warning
      button_link_to(name, options, html_options, &block)
    end

    def button_success_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] = :success
      button_link_to(name, options, html_options, &block)
    end

    def button_info_link_to(name = nil, options = nil, html_options = {}, &block)
      html_options[:type] = :info
      button_link_to(name, options, html_options, &block)
    end
  end
end