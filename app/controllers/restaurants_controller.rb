class RestaurantsController < ApplicationController
  require 'faker'

  def new
    @restaurants = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end
end
