class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    reset_session
  end

  def logged_in?
    !!current_user
  end
end
