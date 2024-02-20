class ApplicationController < ActionController::Base
  helper_method :current_user


  def current_user
    return @current_user if defined?(@current_user)
    if(session[:current_user_id])
      @current_user ||= User.find(session[:current_user_id])
    else
      @current_user ||= User.first
      session[:current_user_id] = @current_user.id
    end
    @current_user
  end

end
