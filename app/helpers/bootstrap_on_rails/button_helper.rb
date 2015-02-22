module BootstrapOnRails
  module ButtonHelper
    def button_primary(title, options = {})
      options[:class] ||= ''
      options[:class] << 'btn-primary'
      default_button(title, options)
    end

    def button_default(title, options = {})
      options[:class] ||= ''
      options[:class] << 'btn-default'
      default_button(title, options)
    end

    private
      def default_button(title, options = {})
        options[:class] << ' btn'
        content_tag :button, title, options
      end
  end
end