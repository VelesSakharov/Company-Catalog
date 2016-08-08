class PositionsController < ApplicationController

  def index
    if params.has_key?(:company_id)
        @company = Company.find(params[:company_id])
        @position_ids = @company.positions.find(params[:company_id])
        @positions = Position.find(:position_ids)
    else
        @positions = Position.order(id: :desc)
    end
  end

  def new
    @position = Position.new
  end

  def create

    @position = Position.new(position_params)

    if @position.save
      flash[:notice] = "Position successfully created"
      redirect_to positions_url
    else
      flash[:alert] = "Error creating position"
      render :new
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    flash[:alert] = "Position deleted"
    redirect_to(companies_url)
  end

  def show
    @company = Company.find(params[:id])
    @position = @company.positions.find(params[:company_ids])
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update

    @position = Position.find(params[:id])

    if @position.update(position_params)
      flash[:notice] = "Position successfully updated"
      redirect_to companies_url
    else
      render :edit
    end
  end

  private

  def position_params
    params.require(:position).permit(:name, :description)
  end

end
