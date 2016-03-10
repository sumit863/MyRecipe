class ReviewsController < ApplicationController
  before_action :require_user

  def create
    @review = Review.new(review_params)
    @review.chef = current_user
    @review.recipe_id = params[:recipe_id]
    if @review.save
      flash[:success] = "Your Review has been added successfully"
      redirect_to recipe_path(@review.recipe)
    else
      redirect_to recipe_path(@review.recipe)
    end
  end
  
  private
    def review_params
      params.require(:review).permit(:review)
    end
end