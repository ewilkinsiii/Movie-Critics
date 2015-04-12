class Api::V1::RatingsController < ApplicationController
  def show
    @rating = Rating.find_by(:movie_id => params[:movie_id], :user_id => params[:user_id])
  end

  def create
    @rating = Rating.find_by(:movie_id => params[:movie_id], :user_id => params[:user_id])
    if @rating
      @rating.update(:score => params[:score])
    else
      @rating = Rating.create(:movie_id => params[:movie_id], :user_id => params[:user_id], :score => params[:score])
    end
    render 'show'
  end
end
