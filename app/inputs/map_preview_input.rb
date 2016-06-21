# app/inputs/video_preview_input.rb
class MapPreviewInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build

    out << @builder.hidden_field(:lat, data: {geo: 'lat'}).html_safe
    out << @builder.hidden_field(:lng, data: {geo: 'lng'}).html_safe

    input_html_options[:class] << "form-control"
    input_html_options[:class] << "geocomplete"
    out << @builder.text_field(attribute_name, input_html_options)

    out << template.content_tag("div", nil, id: "map", style: "width:100%;height:400px;margin-top:15px;")
  end
end
