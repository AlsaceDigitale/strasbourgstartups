class Admin::StartupsController < Admin::BaseController

  inherit_resources

protected

  def permitted_params
    params.permit(startup: [:logo, :name, :email, :url, :description, :tag_list, :is_published, :added_on])
  end

  def begin_of_association_chain
    current_user.is_admin? ? nil : current_user
  end

  def collection
    sort_param, sort_order = params[:s].present? ? params[:s].split("+") : [nil, nil]
    sort_param ||= :added_on
    sort_order ||= :desc
    hsh = {}
    hsh[sort_param.to_sym] = sort_order.to_sym
    get_collection_ivar || set_collection_ivar(end_of_association_chain.order(hsh))
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
