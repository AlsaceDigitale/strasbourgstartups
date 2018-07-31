module ApplicationHelper
  def sort_link(search_object, attribute, *args, &block)
    text = args.first
    if current_user.is_admin?
      current_sort_param, current_sort_order = params[:s].present? ? params[:s].split("+") : [nil, nil]
      sort_param = attribute
      sort_order = current_sort_param && current_sort_param.to_sym == attribute.to_sym ? (current_sort_order == "asc" ? "desc" : "asc") : "asc"
      if current_sort_order.present? && current_sort_param && current_sort_param.to_sym == attribute.to_sym
        text += sort_order == "asc" ? " ▲" : " ▼"
      end
      link_to(text.html_safe, {s: "#{sort_param}+#{sort_order}"})
    else
      text
    end
  end

  def fa_icon name, options = {}
    ""
  end
end
