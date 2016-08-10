class UsersController < ApplicationController

    def index
      @company = Company.find(params[:company_id])
      @users = User.order(id: :asc)
    end

    def new
      @company = Company.find(params[:company_id])
      @user= User.new
    end

    def create

      @user = User.new(user_params)

      if @user.save
        flash[:notice] = "Employee successfully created"
        redirect_to company_user_path(params[:company_id], @user.id)
      else
        flash[:alert] = "Error creating department"
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:alert] = "User deleted"
      redirect_to(company_users_path)
    end

    def show
      @company = Company.find(params[:company_id])
      @user = User.find(params[:id])
      @position = Position.find(@user.position_id)
    end

    def edit
      @company = Company.find(params[:company_id])
      @user = User.find(params[:id])
    end

    def update

      @user = User.find(params[:id])

      if @user.update(user_params)
        flash[:notice] = "User successfully updated"
        redirect_to company_user_path(@user.company_id, @user.id)
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :birth, :contacts, :status, :lastwork, :education, :company_id, :position_id)
    end

  end

