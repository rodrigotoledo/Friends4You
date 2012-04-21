class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  
  def current_user
    return @current_user if defined?(@current_user)
    if(session[:current_user])
      @current_user ||= User.find(session[:current_user]['id'])
    else
      @current_user ||= User.first
      session[:current_user] = @current_user.attributes
    end
  end
  
end
