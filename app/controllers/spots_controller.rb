class SpotsController < ApplicationController





  def action
  @lat_lng = cookies[:lat_lng]
end


def show
  @spot = Spot.find(params[:id])

  		#sets up hash for map marker
  		@hash = Gmaps4rails.build_markers(@spot) do |spot, marker|
  		  marker.lat spot.latitude
  		  marker.lng spot.longitude
  		  marker.infowindow "<a target='blank' href='https://www.google.com/maps/place/"+"#{spot.address}"+"'>Get Directions With Google Maps</a>"
  		  marker.json({ title: spot.title})
  		end
      @reviews = Review.where(spot_id: @spot.id).order("created_at DESC")

       if @reviews.blank?
         @avg_review = 0
       else
         @avg_review = @reviews.average(:rating).round(2)
       end

end
def new
		@spot = current_user.spots.build
    @user= User.all
	end

	# POST "/farms"
	def create
		@spot= current_user.spots.build(spot_params)

		if @spot.save

			redirect_to spot_path(@spot)
		else

			render :new
		end

end
def edit
  @spot = Spot.find(params[:id])

end

def update
  @spot = Spot.find(params[:id])
  @spot.update(spot_params)
  if @spot.save
    respond_to do |format|
      format.js
      format.html
    end
    flash[:notice] = "Your spot has successfully be Updated"
    redirect_to root_path
  else
    flash[:alert] = "There was an issue updating boat"
    render :edit
  end
end

# GET "/spots/search"
	def search
		@location = params[:search]
		@distance = params[:miles]
		@spots = Spot.near(@location, @distance)

		if @location.empty?
			 flash[:notice] ="You can't search without a search term; please enter a location and retry!"
			redirect_to "/"
		else
			if @spots.length < 1
			 flash[:notice] = "Sorry! We couldn't find any parking spots within #{@distance} miles of #{@location}."
				redirect_to "/"
			else
				search_map(@spots)
			end
		end

end


def search_map(spots)
		@spots = spots
		@hash = Gmaps4rails.build_markers(@spots) do |spots, marker|
			  marker.lat spots.latitude
			  marker.lng spots.longitude
			  marker.infowindow "<a href='/spots/"+"#{spots.id}"+"'>#{spots.title}, #{spots.address}</a>"
			  marker.json({ title: spots.title, id: spots.id })
			end
end

    private

def spot_params
  params.require(:spot).permit(:title, :address, :status, :phonenumber)
end

end
