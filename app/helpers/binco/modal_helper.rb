module Binco
  module ModalHelper
    def modal(id, &block)
      content_tag :div, class: 'modal fade', tabindex: '-1', id: id do
        content_tag :div, class: 'modal-dialog' do
          content_tag :div, class: 'modal-content' do
            yield
          end
        end
      end
    end

    def modal_header(title = nil, &block)
      content_tag :div, class: 'modal-header' do
        close = content_tag :button, class: 'close' do
          content_tag(:span, '&times;'.html_safe, data: { dismiss: 'modal' } )
        end
        if block_given?
          title = yield
        else
          title = content_tag(:h4 , title, class: 'modal-title')
        end

        "#{title}#{close}".html_safe
      end
    end

    def modal_body(options = {}, &block)
      options[:class] ||= 'modal-body'
      options[:class] << ' modal-body'
      content_tag :div, options do
        yield
      end
    end

    def modal_footer(&block)
      content_tag :div, class: 'modal-footer' do
        yield
      end
    end
  end
end
