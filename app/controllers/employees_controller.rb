class EmployeesController < ApplicationController
  before_action :find_company
  before_action :find_employee, only: %w(destroy update show edit)

    def index
      @employees = @company.employees.order(id: :asc)
    end

    def new
      @employee = @company.employees.new
    end

    def create

      @employee = Employee.new(employee_params)
      if @employee.save
        flash[:notice] = 'Employee successfully created'
        redirect_to company_employee_path(params[:company_id], @employee.id)
      else
        flash[:alert] = 'Error creating department'
        render :new
      end
    end

    def destroy
      @employee.destroy
      flash[:alert] = 'Employee deleted'
      redirect_to(company_employees_path)
    end

    def show
      @employee = @company.employees.find(params[:id])
    end

    def edit
    end

    def update
      if @employee.update(employee_params)
        flash[:notice] = 'Employee successfully updated'
        redirect_to company_employee_path(@employee.company_id, @employee.id)
      else
        render :edit
      end
    end

    private

    def employee_params
      params.require(:employee)
            .permit(:name, :birth, :contacts, :status, :lastwork,
                    :education, :company_id, :position_id)
    end

    def find_employee
      @employee = Employee.find(params[:id])
    end

    def find_company
      @company = Company.find(params[:company_id])
    end
end
