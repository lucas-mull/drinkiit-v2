class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def set_success(value, message)
    @success = value
    @message = message
  end

  def signed_in?
  	!session[:user_id].nil?
  end

  helper_method :current_user
  
end
