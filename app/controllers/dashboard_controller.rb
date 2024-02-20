class DashboardController < ApplicationController
  def index
  end

  def change_user
    User.clear_visit
    @current_user          = User.find(params[:id])
    session[:current_user_id] = @current_user.id
    redirect_to root_path
  end

  def clear_visit
    User.clear_visit
    redirect_to root_path
  end
end
