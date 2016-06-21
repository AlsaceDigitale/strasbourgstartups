class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  before_action :no_cache!

  layout "admin"

private

  def no_cache!
    response.headers["Cache-Control"] = "no-store, no-cache"
  end
end
