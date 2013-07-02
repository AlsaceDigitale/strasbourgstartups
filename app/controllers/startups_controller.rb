class StartupsController < ApplicationController
  def index
  end

  def new
  	@startup = Startup.new
  end

  def create
  	@startup = Startup.new create_params

  	if @startup.save
  		render :action => "thanks"
  	else
  		render :action => "new"
  	end
  end

  protected
  def create_params
  	params.require(:startup).permit(:name, :url, :adress, :email, :description, :logo)
  end

end
