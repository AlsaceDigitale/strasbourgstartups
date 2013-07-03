class StartupsController < ApplicationController
  def index
    @startups = Startup.is_published.all
    respond_to do |format|
      format.html
      format.json {
        list = Startup.is_published.all

        startups = list.uniq{|startup| startup.name}.inject([]) {|memo, startup|
          hsh = {
            lat: startup.coordinates.first,
            lng: startup.coordinates.last,
            name: startup.name,
            description: startup.description,
            address: startup.address,
            url: startup.url
          }
          memo << hsh
          memo
        }

        render :json => startups.to_json
      }
    end
  end

  def new
  	@startup = Startup.new
  end

  def create
  	@startup = Startup.new create_params
    @startup.coordinates = Geocoder.coordinates(@startup.address)

  	if @startup.save
  		render :action => "thanks"
  	else
  		render :action => "new"
  	end
  end

  protected

  def create_params
  	params.require(:startup).permit(:name, :url, :street, :zip_code, :city, :email, :description, :logo)
  end
end
