class StartupsController < ApplicationController

protected

  def permitted_params
    params.permit(startup: [:logo, :name, :email, :url, :description])
  end

public

  def index
    @startups = Startup.publicly_visible
    if params[:tag].present?
      @startups = @startups.in(tags: params[:tag])
    end
    @startups = @startups.sort_by{|x| x.name.downcase}
  end

  def show
    if params[:visible].present?
      @startup = Startup.find params[:id]
    else
      @startup = Startup.publicly_visible.find params[:id]
    end
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new permitted_params[:startup]
    if Rails.env.development? ? @startup.save : (verify_recaptcha(model: @startup) && @startup.save)
      flash[:notice] = "Merci de votre contribution, nous allons bientôt reprendre contact avec vous !"
      redirect_to new_startup_path
    else
      render action: :new
    end
  end
end
