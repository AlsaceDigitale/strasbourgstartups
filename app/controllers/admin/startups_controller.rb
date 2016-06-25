class Admin::StartupsController < Admin::BaseController

  inherit_resources

protected

  def permitted_params
    params.permit(startup: [:logo, :name, :email, :url, {description_translations: [:fr, :en]}, :is_published, :added_on])
  end

  def begin_of_association_chain
    current_user.is_admin? ? nil : current_user
  end

  def collection
    sort_param, sort_order = params[:s].present? ? params[:s].split("+") : [nil, nil]
    sort_param ||= :added_on
    sort_order ||= :desc
    get_collection_ivar || set_collection_ivar(end_of_association_chain.send(sort_order.to_sym, sort_param.to_sym))
  end

public

  def create
    create! do |success, failure|
      success.html {
        redirect_to({action: :index})
      }
    end
  end

  def update
    update! do |success, failure|
      success.html {
        redirect_to({action: :index})
      }
    end
  end
end
