class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless Rails.configuration.action_controller.consider_all_requests_local
    rescue_from ActionController::RoutingError,      with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from Mongoid::Errors::DocumentNotFound,   with: :render_404
  end

private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_root_path
  end

  def render_404(exception)
    render template: 'errors/404', status: 404
  end
end
