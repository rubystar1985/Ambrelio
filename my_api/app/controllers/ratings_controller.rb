class RatingsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @rating = Rating.new rating_params
    @rating[:post_id] = params[:post_id]
    @rating.save
    binding.pry
    render json: { average_rate: average_rate}
  end

  def average_rate
    rates = Rating.where(post_id: params[:post_id]).pluck(:rate)
    (rates.sum.to_f / rates.count).round(1)
  end



  def rating_params
    params.require(:rating).permit(:rate)
  end
end
