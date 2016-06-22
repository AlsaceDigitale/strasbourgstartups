class Admin::StartupsController < Admin::BaseController

  inherit_resources

protected

  def permitted_params
    params.permit(startup: [:logo, :name, :url, {description_translations: [:fr, :en]}, :is_published, :added_on])
  end

  def begin_of_association_chain
    current_user.is_admin? ? nil : current_user
  end

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.desc(:added_on))
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
