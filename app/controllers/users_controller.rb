class UsersController < Clearance::UsersController
  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    flash[:success] = 'Rigths changed!'
    redirect_to :back
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = 'User deleted!'
    redirect_to :back
  end

  def list
    if !signed_in?
      redirect_to root_path
    elsif current_user.admin?
      @users = User.order(id: :desc)
    else
      redirect_to companies_url
    end
  end
end
