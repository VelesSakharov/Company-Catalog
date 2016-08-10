class PositionsController < ApplicationController
  #before_filter :position_find, :only=> %w[destroy edit update]

  def index
    if params.has_key?(:company_id)
      @company = Company.find(params[:company_id])
      @positions = @company.positions
    else
      @positions = Position.order(id: :asc)
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
    redirect_to(positions_url)
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

  def position_find
    @position = Position.find(params[:id])
  end
end
