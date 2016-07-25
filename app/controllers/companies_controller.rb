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
    redirect_to @company
    else
      redirect_to new_company_path, alert: "Error creating company."
    end

  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

      respond_to do |format|
        format.html { redirect_to(companies_url) }
        format.xml  { head :ok }
      end
    end


  def show
    @companies = Company.find(params[:id])
    @company = Company.last
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
    params.require(:company).permit(:company_name, :company_location, :company_contacts, :company_type)
  end


end