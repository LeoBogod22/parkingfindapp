class WelcomeController < ApplicationController



  #GET "/"
	def index
		@recent_spots = Spot.last(6).reverse


	end

end
