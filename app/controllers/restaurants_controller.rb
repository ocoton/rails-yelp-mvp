class RestaurantsController < ApplicationController
  CATEGORIES = ['chinese', 'italian', 'japanese', 'french', 'belgian']
# white i tried to make the above a variable which is called in the seeds - but didnt work.
# white requires in migrations not working

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
