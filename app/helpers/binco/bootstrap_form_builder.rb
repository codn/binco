module Binco
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    alias_method :collection_select_original, :collection_select
    alias_method :check_box_original, :check_box
    alias_method :select_original, :select
    alias_method :submit_original, :submit

    CHECK_BOX_GROUP_CLASS = 'form-check'
    CHECK_BOX_LABEL_CLASS = 'form-check-label'
    FORM_ELEMENT_CLASS = 'form-control'
    CHECK_BOX_INPUT_CLASS = 'form-check-input'

    ERROR_PROC = Proc.new do |html_tag, instance|
      if instance.respond_to?(:error_message) && instance.class.to_s != 'ActionView::Helpers::Tags::Label'
        error_messages = instance.error_message.collect{ |error| "<div class=\"invalid-feedback\">#{error}</div>" }.join

        "#{html_tag.gsub(/class="/, 'class="is-invalid ')} #{error_messages}".html_safe
      else
        html_tag
      end
    end

    def initialize(object_name, object, template, options)
      ActionView::Base::field_error_proc = ERROR_PROC

      super(object_name, object, template, options)
    end

    def text_field(name, options = {})
      options = add_class_to_options(FORM_ELEMENT_CLASS, options)
      super name, options
    end

    def telephone_field(name, options = {})
      options = add_class_to_options(FORM_ELEMENT_CLASS, options)
      super name, options
    end
    alias_method :phone_field, :telephone_field

    def select(method, choices = nil, options = {}, html_options = {}, &block)
      html_options = add_class_to_options('custom-select', html_options)
      super method, choices, options, html_options, &block
    end

    def select2(method, choices = nil, options = {}, html_options = {}, &block)
      html_options = add_class_to_options('select2-rails', html_options)
      select_original method, choices, options, html_options, &block
    end

    def collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      if block_given?
        super(method, collection, value_method, text_method, options, html_options, &block)
      else
        super method, collection, value_method, text_method, options, html_options do |b|
          group_tag class: CHECK_BOX_GROUP_CLASS do
            b.label class: CHECK_BOX_LABEL_CLASS do
              b.check_box(class: CHECK_BOX_INPUT_CLASS) + " " + b.text
            end
          end
        end
      end
    end

    # Since select2 support multiple choices (checkboxes)
    def collection_check_boxes2(method, collection, value_method, text_method, options = {}, html_options = {})
      html_options ||= {}
      html_options[:multiple] = 'multiple'
      collection_select2 method, collection, value_method, text_method, options, html_options
    end

    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      html_options = add_class_to_options('custom-select', html_options)
      super method, collection, value_method, text_method, options, html_options
    end

    def collection_select2(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      html_options = add_class_to_options('select2-rails', html_options)
      collection_select_original(method, collection, value_method, text_method, options, html_options)
    end

    def email_field(name, options = {})
      options = add_class_to_options(FORM_ELEMENT_CLASS, options)
      super name, options
    end

    def number_field(name, options = {})
      options = add_class_to_options(FORM_ELEMENT_CLASS, options)
      super name, options
    end

    def password_field(name, options = {})
      options = add_class_to_options(FORM_ELEMENT_CLASS, options)
      super name, options
    end

    def datepicker(method, options = {})
      options = add_data_to_options({ provide: 'datepicker' }, options)
      text_field(method, options)
    end

    def text_area(method, options = {})
      options = add_class_to_options(FORM_ELEMENT_CLASS, options)
      super(method, options)
    end

    def radio_button(method, tag_value, options = {})
      super method, tag_value, options
    end

    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      options = add_class_to_options(CHECK_BOX_INPUT_CLASS, options)
      super method, options, checked_value, unchecked_value
    end

    def custom_check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      options = add_class_to_options('custom-control-input', options)
      base_proc = ActionView::Base::field_error_proc
      ActionView::Base::field_error_proc = Proc.new { |html_tag, instance| html_tag }
      html = check_box_original(method, options, checked_value, unchecked_value)
      ActionView::Base::field_error_proc = base_proc

      return html
    end

    def file_field(method, options = {})
      options = add_class_to_options('form-control-file', options)
      super method, options
    end

    def submit(value = nil, options = {})
      options = add_class_to_options('btn btn-success', options)
      add_data_to_options({ disable_with: 'Enviando' }, options)
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

    def form_check(options = {}, &block)
      options = add_class_to_options(CHECK_BOX_GROUP_CLASS, options)
      group_tag options, &block
    end
    alias_method :check_box_group, :form_check

    def check_label(method, options = {}, &block)
      options = add_class_to_options(CHECK_BOX_LABEL_CLASS, options)
      @template.label(@object_name, method, nil, objectify_options(options), &block)
    end
    alias_method :check_box_label, :check_label

    def input_group(options = {}, &block)
      options = add_class_to_options('input-group', options)
      group_tag options, &block
    end

    def addon(icon, options = {})
      input_group_append(icon, options)
    end

    def input_group_prepend(content, options = {})
      options = add_class_to_options('input-group-prepend', options)
      @template.content_tag(:div, @template.content_tag(:span, content, { class: 'input-group-text' }), options)
    end

    def input_group_append(content, options = {})
      options = add_class_to_options('input-group-append', options)
      @template.content_tag(:div, @template.content_tag(:span, content, { class: 'input-group-text' }), options)
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
