class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, alert: "Company created successfully."
    else
      redirect_to new_company_path, alert: "Error creating company."
    end
  end

  def show
    @companies = Company.find(params[:id])
  end
end
