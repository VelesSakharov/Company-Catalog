class DepartmentsController < ApplicationController
  before_action :company_find
  before_action :find_department, only: %w(destroy update edit)
  before_action :require_login

  def index
    @departments = @company.departments.order(id: :desc)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      flash[:success] = 'Department successfully created.'
      redirect_to company_department_path(@department.company_id, @department.id)
    else
      flash[:alert] = 'Error creating department.'
      render :new
    end
  end

  def destroy
    @department.destroy
    flash[:alert] = 'Department deleted.'
    redirect_to(company_departments_path)
  end

  def show
    @department = @company.departments.find(params[:id])
  end

  def edit
  end

  def update
    @department = Department.find(params[:id])

    if @department.update(department_params)
      flash[:success] = 'Department successfully updated.'
      redirect_to company_department_path(@department.company_id, @department.id)
    else
      render :edit
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :description, :company_id)
  end

  def company_find
    @company = Company.find(params[:company_id])
  end

  def find_department
    @department = Department.find(params[:id])
  end
end
