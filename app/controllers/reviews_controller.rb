class ReviewsController < ApplicationController
  def create
    @review = Review.new(strong_params)
    @review[:cocktail_id] = params[:cocktail_id]
    @cocktail = Cocktail.find(params[:cocktail_id])
    return redirect_to @cocktail if @Review.save
    redirect_to @cocktail
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    @cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to @cocktail
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end
end
