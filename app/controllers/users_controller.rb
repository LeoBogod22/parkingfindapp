class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])





    @reviews = Review.where(user_id: @user.id).order("created_at DESC")

     if @reviews.blank?
       @avg_review = 0
     else
       @avg_review = @reviews.average(:rating).round(2)
     end
end
end
