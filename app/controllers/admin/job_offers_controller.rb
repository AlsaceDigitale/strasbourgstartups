class Admin::JobOffersController < Admin::BaseController

  inherit_resources
  belongs_to :startup

protected

  def permitted_params
    params.permit(job_offer: [:end_publishing_on, :is_published, :title, :body])
  end

  def begin_of_association_chain
    current_user.is_admin? ? nil : current_user
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
