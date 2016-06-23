class Admin::UsersController < Admin::BaseController

  before_action :check_current_user
  inherit_resources

protected

  def permitted_params
    params.permit(user: [:email, :first_name, :last_name, :password, :password_confirmation, :is_admin, {startup_ids: []}])
  end

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.desc(:created_at).paginate(page: params[:page], per_page: 20))
  end

  def check_current_user
    unless current_user.is_admin?
      redirect_to_current_user_home
      flash[:error] = "Vous n'avez pas accès à cette partie de l'administration."
    end
  end

public

  def create
    create! do |success, failure|
      success.html {
        redirect_to({action: :index})
      }
    end
  end

  def create_invitation
    @user = User.new permitted_params[:user]
    if [@user.email, @user.first_name, @user.startup_ids].all?(&:present?) || (@user.is_admin? && @user.email.present?)
      User.invite!(email: @user.email, first_name: @user.first_name, last_name: @user.last_name, startup_ids: @user.startup_ids, is_admin: @user.is_admin)
      redirect_to({action: :index})
    else
      render action: :new
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
