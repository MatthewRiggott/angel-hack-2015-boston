class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :verify_logged_in

  def verify_logged_in
  	if params[:controller] != "devise/registrations" && params[:controller] != "devise/sessions" && params[:controller] != "omniauth_callbacks"
       redirect_to new_user_session_path
    end
  end
end
