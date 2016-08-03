class DepartmentsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @departments = Department.order(id: :desc)
  end

  def new
    @company = Company.find(params[:company_id])
    @department= Department.new
  end

  def create

    @department = Department.new(department_params)

    if @department.save
      flash[:notice] = "Department successfully created"
      redirect_to company_department_path(@department.company_id, @department.id)
    else
      flash[:alert] = "Error creating department"
      render :new
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:alert] = "Department deleted"
    redirect_to(company_departments_path)
  end

  def show
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:id])
   # @departments = Department.order(department_id: :desc)
  end

  def edit
    @company = Company.find(params[:company_id])
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      flash[:notice] = "Department successfully updated"
      redirect_to company_department_path(@department.company_id, @department.id)
    else
      render :edit
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :description, :company_id)
  end

end
