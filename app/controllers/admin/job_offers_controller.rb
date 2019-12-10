class Admin::JobOffersController < Admin::BaseController

  inherit_resources

protected

  def permitted_params
    params.permit(job_offer: [:startup_id, :end_publishing_on, :is_published, :title, :body])
  end

  def begin_of_association_chain
    if current_user.is_admin?
      nil
    else
      @startup = current_user.startups.first
    end
  end

  def collection
    sort_param, sort_order = params[:s].present? ? params[:s].split("+") : [nil, nil]
    sort_param ||= :created_at
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
