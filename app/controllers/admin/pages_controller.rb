class Admin::PagesController < Admin::BaseController

  inherit_resources

protected

  def permitted_params
    params.permit(page: [:code, {title_translations: [:fr, :en]}, {body_translations: [:fr, :en]}])
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
