class PlacesController < ApplicationController

  def new
   @place = Place.new
   @recent_spots = Spot.last(6).reverse
 end
 def show
    @place = Place.find(params[:id])
        @recent_spots = Spot.near(@place)
  end
 def create
   @place = Place.new(place_params)

   if @place.save
     flash[:success] = "Place added!"
     redirect_to place_path(@place)
   else
     render 'new'
   end
 end

 private

 def place_params
   params.require(:place).permit(:title, :raw_address, :latitude, :longitude, :visited_by)
 end
end
