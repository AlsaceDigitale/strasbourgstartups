class StartupsController < ApplicationController

  def index
    @startups = Startup.publicly_visible.all
  end

  def show
    @startup = Startup.find params[:id]
  end
end
