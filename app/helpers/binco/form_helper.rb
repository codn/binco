module Binco
  module FormHelper
    def bootstrap_form_for(record, options = {}, &block)
      options[:builder] = BootstrapFormBuilder
      form_for(record, options, &block)
    end

    def bootstrap_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      options[:builder] = BootstrapFormBuilder

      if block_given?
        form_with(model: model, scope: scope, url: url, format: format, **options, &block)
      else
        form_with(model: model, scope: scope, url: url, format: format, **options)
      end
    end

    def bootstrap_form_tag(url_for_options = {}, options = {}, &block)
      options[:acts_like_form_tag] = true
      options[:url] = url_for_options
      bootstrap_form_for("", options, &block)
    end

    def materialize_form_for(record, options = {}, &block)
      options[:builder] = MaterializeFormBuilder
      form_for(record, options, &block)
    end

    def materialize_form_tag(url_for_options = {}, options = {}, &block)
      options[:acts_like_form_tag] = true
      options[:url] = url_for_options
      materialize_form_for("", options, &block)
    end

  end
end
