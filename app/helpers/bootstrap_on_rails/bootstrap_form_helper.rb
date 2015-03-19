module BootstrapOnRails
  module BootstrapFormHelper
    def bootstrap_form_for(record, options = {}, &block)
      options[:builder] = BootstrapFormBuilder
      form_for(record, options, &block)
    end

    def bootstrap_form_tag(url_for_options = {}, options = {}, &block)
      options[:acts_like_form_tag] = true
      bootstrap_form_for("", options, &block)
    end
  end
end