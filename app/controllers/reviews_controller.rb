class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]
 before_action :set_user
 before_action :authenticate_user!

 def new
   @review = Review.new
 end

 def edit
 end

 def create
   @review = Review.new(review_params)
   @review.user_id = current_user.id
   @review.user_id = @user.id

   if @review.save
     redirect_to @user
   else
     render 'new'
   end
 end

 def update
   @review.update(review_params)
 end

 def destroy
   @review.destroy
   redirect_to root_path
 end

 private
   def set_review
     @user = User.find(params[:id])
   end

   def set_user
     @user = User.find(params[:user_id])
   end

   def review_params
     params.require(:review).permit(:rating, :comment)
   end
end
