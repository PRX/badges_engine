require 'haml-rails'

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def logout
    self.current_user = nil
  end
        
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def current_user=(user)
    @current_user = user
    session[:user_id] = user.try(:id)
  end
  
end
