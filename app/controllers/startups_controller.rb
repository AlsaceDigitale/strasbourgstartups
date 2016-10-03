class StartupsController < ApplicationController

protected

  def permitted_params
    params.permit(startup: [:logo, :name, :email, :url, {description_translations: [:fr, :en]}])
  end

public

  def index
    @startups = Startup.publicly_visible
    @startups = @startups.tagged_with params[:tag] if params[:tag].present?
    @startups = @startups.sort_by{|x| x.name.downcase}
  end

  def show
    @startup = Startup.find params[:id]
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new permitted_params[:startup]
    if verify_recaptcha(model: @startup) && @startup.save
      flash[:notice] = "Merci de votre contribution, nous allons bientôt reprendre contact avec vous !"
      redirect_to new_startup_path
    else
      render action: :new
    end
  end
end
