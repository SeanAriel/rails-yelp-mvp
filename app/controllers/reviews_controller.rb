class ReviewsController < ApplicationController
  before_action :get_resto

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
        redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
      else
        render "restaurants/show"
    end
  end

  private

  def get_resto
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
