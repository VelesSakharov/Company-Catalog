class CompaniesController < ApplicationController
  before_action :find_company, only: %w(show edit update destroy)
  after_action :verify_authorized, only: [:destroy]

  def index
    @companies = Company.order(id: :desc)
  end

  def new
    redirect_to :back unless signed_in?
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:success] = 'Company successfully created.'
      redirect_to @company
    else
      flash[:alert] = 'Error creating company.'
      render :new
    end
  end

  def destroy
    if @company.present?
      authorize @company
      @company.destroy
    else
      skip_authorization
    end
    flash[:alert] = 'Company deleted.'
    redirect_to companies_url
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      flash[:success] = 'Company successfully updated.'
      redirect_to @company
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company)
          .permit(:name, :location, :contacts, :ownership, position_ids: [])
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
