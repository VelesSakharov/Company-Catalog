class CompaniesController < ApplicationController



  def index
    @companies = Company.order(id: :desc)
  end

  def new
    @company = Company.new
  end

  def create

    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = "Company successfully created"
      redirect_to @company
    else
      flash[:alert] = "Error creating company"
      render :new
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:alert] = "Company deleted"
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

    if @company.update(company_params)
      flash[:notice] = "Company successfully updated"
      redirect_to @company
     else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :contacts, :ownership)
  end

end