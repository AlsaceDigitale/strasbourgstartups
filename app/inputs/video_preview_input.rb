# app/inputs/video_preview_input.rb
class VideoPreviewInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    # :preview_version is a custom attribute from :input_html hash, so you can pick custom sizes
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build
    # allow multiple submissions without losing the tmp version
    # out << @builder.hidden_field("#{attribute_name}_cache").html_safe
    # append file input. it will work accordingly with your simple_form wrappers
    input_html_options[:class] ||= ""
    input_html_options[:class] << " form-control"
    input_html_options[:style] ||= ""
    input_html_options[:style] << "margin-top:10px;height:100px;"
    out << @builder.text_area(attribute_name, input_html_options)
    # check if there's an uploaded file (eg: edit mode or form not saved)
    if object.send("#{attribute_name}?")
      # append preview image to output
      out << template.content_tag("div", object.send(attribute_name).html_safe, style: "margin-top:10px;")
    end
    out
  end
end
