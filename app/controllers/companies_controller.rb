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
      flash[:created] = "Post successfully created"
      redirect_to @company
    else
      flash[:error] = "Error creating company"
      redirect_to (:back) #new_company_path(@company)
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:deleted] = "Company deleted"
    redirect_to(companies_url)
  end

  def show
    @company = Company.find(params[:id])
  end

   def edit
     @company = Company.find(params[:id])
   end

  def update
    @company = Company.find(params[:id])
    @company.update!(company_params)
    redirect_to @company
    flash[:updated] = "Post successfully updated"
   end

  private

  def company_params
    params.require(:company).permit(:name, :location, :contacts, :ownership)
  end

end