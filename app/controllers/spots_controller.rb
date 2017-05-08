class SpotsController < ApplicationController





  def action
  @lat_lng = cookies[:lat_lng]
end



def new
		@spot = Spot.new
	end

  def show
    @spot = Spot.find(params[:id])

    		#sets up hash for map marker
    		@hash = Gmaps4rails.build_markers(@spot) do |spot, marker|
    		  marker.lat spot.latitude
    		  marker.lng spot.longitude
    		  marker.infowindow "<a target='blank' href='https://www.google.com/maps/place/"+"#{spot.address}"+"'>Get Directions With Google Maps</a>"
    		  marker.json({ title: spot.title })
    end

  end

	# POST "/farms"
	def create
		@spot= Spot.new(spot_params)

		if @spot.save

			redirect_to spot_path(@spot)
		else

			render :new
		end
end



private




def spot_params
 params.require(:spot).permit(:title, :address)
end
end
