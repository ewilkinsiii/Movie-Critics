class Api::V1::CommentsController < ApplicationController
  def show
    @comment = Comments.find_by(:movie_id => params[:movie_id], :user_id => params[:user_id],:rating_id => params[:rating_id])
  end

  def create
    @comment = Comments.find_by(:movie_id => params[:movie_id], :user_id => params[:user_id], :comment => params[:comments], :like => params[:like_count], :unlike => params[:unlike_count])
    if @comment
      @comment.update(:comment => params[:comments], :like => params[:like_count], :unlike => params[:unlike_count] )
    else
      @comment = Comments.create(:movie_id => params[:movie_id], :user_id => params[:user_id], :comment => params[:comments], :like => params[:like_count], :unlike => params[:unlike_count])
    end
    render 'show'
  end
end
