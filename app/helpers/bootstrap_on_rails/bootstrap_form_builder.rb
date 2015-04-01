module BootstrapOnRails
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    def text_field(name, options = {})
      options = add_class_to_options('form-control', options)
      super name, options
    end

    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      html_options = add_class_to_options('form-control', options)
      super method, collection, value_method, text_method, options, html_options
    end

    def email_field(name, options = {})
      options = add_class_to_options('form-control', options)
      super name, options
    end

    def number_field(name, options = {})
      options = add_class_to_options('form-control', options)
      super name, options
    end

    def password_field(name, options = {})
      options = add_class_to_options('form-control', options)
      super name, options
    end

    def datepicker(method, options = {})
      options = add_data_to_options({ provide: 'datepicker' }, options)
      text_field(method, options)
    end

    def radio_button(method, tag_value, options = {})
      options = add_class_to_options('radio', options)
      super method, tag_value, options
    end

    def submit(value = nil, options = {})
      options = add_class_to_options('btn btn-success', options)
      super value, options
    end

    def form_group(options = {}, &block)
      options = add_class_to_options('form-group', options)
      group_tag options, &block
    end

    def radio_group(options = {}, &block)
      options = add_class_to_options('radio', options)
      group_tag options, &block
    end

    def input_group(options = {}, &block)
      options = add_class_to_options('input-group', options)
      group_tag options, &block
    end

    private

      # Add the specified class_name the the options hash
      def add_class_to_options(class_name, options = {})
        options[:class] ||= ''
        options[:class] << " #{class_name}"
        options
      end

      # Add the specified data-attributes the the options hash
      def add_data_to_options(data, options = {})
        options[:data] ||= {}
        options[:data].merge! data
        options
      end

      def group_tag(attributes = {}, &block)
        @template.content_tag :div, attributes do
          yield
        end
      end
  end
end
