module Binco
  class PaginationRenderer < ::WillPaginate::ViewHelpers::LinkRendererBase
    # * +collection+ is a WillPaginate::Collection instance or any other object
    #   that conforms to that API
    # * +options+ are forwarded from +will_paginate+ view helper
    # * +template+ is the reference to the template being rendered
    def prepare(collection, options, template)
      super(collection, options)
      @template = template
      @container_attributes = @base_url_params = nil
    end

    # Process it! This method returns the complete HTML string which contains
    # pagination links. Feel free to subclass LinkRenderer and change this
    # method as you see fit.
    def to_html
      html = pagination.map do |item|
        item.is_a?(Fixnum) ?
          page_number(item) :
          send(item)
      end.join(@options[:link_separator])

      @options[:container] ? html_container(html) : html
    end

    # Returns the subset of +options+ this instance was initialized with that
    # represent HTML attributes for the container element of pagination links.
    def container_attributes
      @container_attributes ||= @options.except(*(ViewHelpers.pagination_options.keys + [:renderer] - [:class]))
    end

  protected

    def page_number(page)
      unless page == current_page
        tag(:li, link(page, page, rel: rel_value(page)))
      else
        tag(:li, link(page, '#'), class: 'active')
      end
    end

    def gap
      text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
      %(<li><a>#{text}</a></li>)
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], 'previous_page')
    end

    def next_page
      num = @collection.current_page < total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], 'next_page')
    end

    def previous_or_next_page(page, text, classname)
      if page
        tag(:li, link(text, page, class: classname))
      else
        tag(:li, link(text, '#'), class: classname + ' disabled')
      end
    end

    def html_container(html)
      tag(:ul, html, class: 'pagination pagination-xs')
    end

    # Returns URL params for +page_link_or_span+, taking the current GET params
    # and <tt>:params</tt> option into account.
    def default_url_params
      {}
    end

    def url(page)
      @base_url_params ||= begin
        url_params = merge_get_params(default_url_params)
        url_params[:only_path] = true
        merge_optional_params(url_params)
      end

      url_params = @base_url_params.dup
      add_current_page_param(url_params, page)

      @template.url_for(url_params)
    end

    def merge_optional_params(url_params)
      symbolized_update(url_params, @options[:params]) if @options[:params]
      url_params
    end

    def merge_get_params(url_params)
      if @template.respond_to? :request and @template.request and @template.request.get?
        symbolized_update(url_params, @template.params)
      end
      url_params
    end

    def add_current_page_param(url_params, page)
      unless param_name.index(/[^\w-]/)
        url_params[param_name.to_sym] = page
      else
        page_param = parse_query_parameters("#{param_name}=#{page}")
        symbolized_update(url_params, page_param)
      end
    end

  private

    def parse_query_parameters(params)
      Rack::Utils.parse_nested_query(params)
    end

    def param_name
      @options[:param_name].to_s
    end

    def link(text, target, attributes = {})
      if target.is_a? Fixnum
        attributes[:rel] = rel_value(target)
        target = url(target)
      end
      attributes[:href] = target
      tag(:a, text, attributes)
    end

    def tag(name, value, attributes = {})
      string_attributes = attributes.inject('') do |attrs, pair|
        unless pair.last.nil?
          attrs << %( #{pair.first}="#{CGI::escapeHTML(pair.last.to_s)}")
        end
        attrs
      end
      "<#{name}#{string_attributes}>#{value}</#{name}>"
    end

    def rel_value(page)
      case page
      when @collection.current_page - 1; 'prev' + (page == 1 ? ' start' : '')
      when @collection.current_page + 1; 'next'
      when 1; 'start'
      end
    end

    def symbolized_update(target, other)
      other.each do |key, value|
        key = key.to_sym
        existing = target[key]

        if value.is_a?(Hash) and (existing.is_a?(Hash) or existing.nil?)
          symbolized_update(existing || (target[key] = {}), value)
        else
          target[key] = value
        end
      end
    end
  end
end
