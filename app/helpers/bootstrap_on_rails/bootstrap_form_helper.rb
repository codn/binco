module BootstrapOnRails
  module BootstrapFormHelper
    def bootstrap_form_for(record, options = {}, &block)
      options[:builder] = BootstrapFormBuilder
      form_for(record, options, &block)
    end
  end
end