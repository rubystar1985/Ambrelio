class RatingsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @rating = Rating.new rating_params
    @rating[:post_id] = params[:post_id]
    @rating.save
    render json: { average_rate: @rating.average_rate}
  end

  def rating_params
    params.require(:rating).permit(:rate)
  end
end
