class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(restaurant: Restaurant.find(params[:restaurant]), user: current_user)
    if favorite == []
      Favorite.create(restaurant: Restaurant.find(params[:restaurant]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
  end
  respond_to do |format|
    format.html {}
    format.js {}
end
end
end
