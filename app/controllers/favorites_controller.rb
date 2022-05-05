class FavoritesController < ApplicationController
  def update
    @restaurant = Restaurant.find(params[:restaurant])
    favorite = Favorite.where(restaurant: Restaurant.find(params[:restaurant]), user: current_user)
    if favorite == []
      Favorite.create(restaurant: Restaurant.find(params[:restaurant]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
  end
  redirect_to restaurant_path(@restaurant)
end
end
