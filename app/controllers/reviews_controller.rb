class ReviewsController < ApplicationController
  def new
    @studio = Studio.find(params[:studio_id])
    @review = Review.new
  end

  def create
    @studio = Studio.find(params[:studio_id])
    @studio.reviews.create(review_params)
    redirect_to studios_path
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
