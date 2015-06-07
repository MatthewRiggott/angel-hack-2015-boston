class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  before_filter :verify_logged_in
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def verify_logged_in
    # if we are not logging in or signing up and aren't signed up go to loginpage

    if current_user.nil?
      if params[:controller] != "devise/registrations" && params[:controller] != "devise/sessions"  && params[:controller] != "omniauth_callbacks"
        redirect_to new_user_session_path
      end
    end
  end
  # For APIs, you may want to use :null_session instead.

end
