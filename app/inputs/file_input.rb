class FileInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    if attribute_name == :pdf
      out = ActiveSupport::SafeBuffer.new
      if object.send("#{attribute_name}?")
        title = template.content_tag("span", "Voir la version actuelle #{ template.fa_icon("external-link") }".html_safe, style: "margin-bottom:5px;display:block;")
        link = object.send(attribute_name).send(:url)
        out << template.link_to(title, link, target: "_blank")
      end
      out << @builder.file_field(attribute_name, input_html_options)
    else
      super
    end
  end
end
