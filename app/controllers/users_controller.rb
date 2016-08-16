# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :find_company
  before_action :find_user, only: %w(destroy update show edit)

    def index
      @users = @company.users.order(id: :asc)
    end

    def new
      @user = @company.users.new
    end

    def create

      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Employee successfully created'
        redirect_to company_user_path(params[:company_id], @user.id)
      else
        flash[:alert] = 'Error creating department'
        render :new
      end
    end

    def destroy
      @user.destroy
      flash[:alert] = 'User deleted'
      redirect_to(company_users_path)
    end

    def show
      @user = @company.users.find(params[:id])
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:notice] = 'User successfully updated'
        redirect_to company_user_path(@user.company_id, @user.id)
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user)
            .permit(:name, :birth, :contacts, :status, :lastwork,
                    :education, :company_id, :position_id)
    end

    def find_user
      @user = User.find(params[:id])
    end

    def find_company
      @company = Company.find(params[:company_id])
    end
end
