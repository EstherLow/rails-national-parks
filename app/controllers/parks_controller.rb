class ParksController < ApplicationController
  def index
    @parks = Park.all

  end

  def new
    @park = Park.new
    render :new
  end

  def create
    @park = Park.create(park_params)
    redirect_to parks_path
  end

  def show
    @park = Park.find(params[:name])
    redirect_to parks_path
  end

  def edit
    @park = Park.find(params[:id])
    redirect_to parks_path
  end

  # def update
  # end
  #
  def destroy
    Park.find(params[:id]).delete
    redirect_to parks_path
  end
  private

  def park_params
    params.require(:park).permit(:name, :description, :picture)
  end
end
