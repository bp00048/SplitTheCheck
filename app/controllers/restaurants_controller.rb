class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]
  

  # GET /restaurants or /restaurants.json
  def index
    if !params[:n].nil? && !params[:n].empty?
     @restaurants = Restaurant.where("name LIKE ?", "%" + params[:n] +"%")
    else if !params[:s].nil? && !params[:s].empty?
      @restaurants = Restaurant.where("location LIKE ?", "%" + params[:s] +"%")
    end
  end
end


  # GET /restaurants/1 or /restaurants/1.json
  def show
    @restaurant = Restaurant.all.find(params[:id])
    @favorite_exists = Favorite.where(restaurant: @restaurant, user: current_user) == [] ? false : true

  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

def yes
 @restaurant = Restaurant.all.find(params[:id])
 @restaurant.yes

 redirect_to restaurant_path(@restaurant)
end

def no
 @restaurant = Restaurant.all.find(params[:id])
 @restaurant.no
 redirect_to restaurant_path(@restaurant)
end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :website, :yes_split, :no_split)
    end

end
