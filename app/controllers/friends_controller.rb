# encoding: utf-8
class FriendsController < ApplicationController
  def index
  end

  def show
    @friend = User.find(params[:id])
  end
  
  def new
    @friend = User.new
  end
  
  def visit
    User.clear_visit
    User.visit_friend(params[:id])
    redirect_to :back
  end
  
  def send3friends
    if current_user.send_indications(params[:id],params[:ids])
      redirect_to :back, :notice => 'Indicações enviadas com sucesso'
    else
      redirect_to friend_path(params[:id]), :error => 'Erro ao enviar as indicações'
    end
  end
  
  def create
    @friend = User.new(params[:user])
    
    if @friend.save
      redirect_to friend_path(@friend), :notice => 'Amigo criado com sucesso'
    else
      flash[:error] = 'Erro ao criar o amigo'
      render :action => :new
    end
  end
end
