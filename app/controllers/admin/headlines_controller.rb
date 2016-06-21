class Admin::HeadlinesController < Admin::BaseController

  inherit_resources

protected

  def permitted_params
    params.permit(headline: [:published_at, :banner, {title_translations: [:fr, :en]}, {body_translations: [:fr, :en]}])
  end

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.desc(:published_at).paginate(per_page: 20, page: params[:page]))
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
