class PositionsController < ApplicationController
  before_action :find_position, only: %w(destroy show edit update)

  def index
    if params.has_key?(:company_id)
      @positions = Company.find(params[:company_id]).positions
    else
      @positions = Position.order(id: :asc)
    end
  end

  def new
    redirect_to :back unless signed_in?
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      flash[:success] = 'Position successfully created.'
      redirect_to positions_url
    else
      flash[:alert] = 'Error creating position.'
      render :new
    end
  end

  def destroy
    @position.destroy
    flash[:alert] = 'Position deleted.'
    redirect_to(positions_url)
  end

  def show
  end

  def edit
  end

  def update
    if @position.update(position_params)
      flash[:success] = 'Position successfully updated.'
      redirect_to position_url
    else
      render :edit
    end
  end

  private

  def position_params
    params.require(:position).permit(:name, :description)
  end

  def find_position
    @position = Position.find(params[:id])
  end
end
