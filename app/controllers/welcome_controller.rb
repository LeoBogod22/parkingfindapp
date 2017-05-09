class WelcomeController < ApplicationController



  #GET "/"
	def index
		@recent_spots = Spot.last(6).reverse
		create_markers
    @user=User.find(current_user)
	end

	# Creates all the markers for the farms... Used to on the map in the view.
	def create_markers
  	@all_spots = Spots.near([current_user.latitude, current_user.longitude], 50, :order => :distance)

		@hash = Gmaps4rails.build_markers(@all_spots) do |spot, marker|
		  marker.lat spot.latitude
		  marker.lng spot.longitude
		  marker.infowindow "<a href='/spots/"+"#{spot.id}"+"'>#{spot.name}, #{spot.address}</a>"
		  marker.json({ title: spot.name, id: spot.id })
		end
	end
end
end
