module ImageHelper
  def image_fluid(source, options={})
    tag_class = "img-fluid #{options[:class]}"
    options[:class] = tag_class
    image_tag(source, options)
  end
end
