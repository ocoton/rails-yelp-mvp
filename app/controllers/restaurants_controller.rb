class RestaurantsController < ApplicationController
  CATEGORIES = ['chinese', 'italian', 'japanese', 'french', 'belgian']
# white i tried to make the above a variable which is called in the seeds - but didnt work.

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.save

    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
