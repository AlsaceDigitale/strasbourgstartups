class CalameoPreviewInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build
    out << @builder.text_field(attribute_name, class: "form-control calameo-widget-code")

    if object.send("#{attribute_name}?")
      # append preview image to output
      code = object.send(attribute_name)
      out << template.content_tag("iframe", nil, src: "//v.calameo.com/?bkcode=#{code}", width: "100%", height: "100%", frameborder: "0", scrolling: "no", allowtransparency: "allowtransparency", allowfullscreen: "allowfullscreen", class: "calameo-widget")

    end

    out
  end
end
