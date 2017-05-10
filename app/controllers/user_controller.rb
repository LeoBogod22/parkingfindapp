class UserController < ApplicationController




  


  def location
    respond_to do |format|
      format.json {
        lat = params["lat"]
        lng = params["lng"]
        radius = 5000
        type = "restraunt"
        key = "AIzaSyCVdbc8OFMqdxSci5KETRk2GE91yGumiNU"
        url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=#{radius}&types=#{type}&key=#{key}"
       data = JSON.load(open(url))
       render json: { :data => data }
        current_user_longitude=lng
        current_user_latitude=lat
      }
    end
  end
end
