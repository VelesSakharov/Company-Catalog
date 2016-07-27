class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, alert: "Company created"
    else
      redirect_to new_company_path, alert: "Error creating company."
    end

  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    #flash: "Company deleted"
    redirect_to(companies_url)
  end


  def show
    @companies = Company.find(params[:id])
  end

   def edit
     @company = Company.find(params[:id])
   end

  def update
    @company = Company.find(params[:id])
    @company.update!(company_params)
    redirect_to @company
  end

private

  def company_params
    params.require(:company).permit(:name, :location, :contacts, :ownership)
  end


end