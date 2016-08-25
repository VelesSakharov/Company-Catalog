class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    flash[:success] = 'OK!'
    redirect_to :back
  end
  def index
    if signed_in?
      redirect_to companies_url
    end
  end
  def list
    if !signed_in?
      redirect_to users_url
      elsif current_user.admin?
    @users = User.order(id: :desc)
    else
      redirect_to companies_url
    end
  end
end

#туду - почта:(, вьюху поправить-__-
#не уснуть
#допилить систему логина