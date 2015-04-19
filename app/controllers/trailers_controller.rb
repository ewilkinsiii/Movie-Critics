class TrailersController < ApplicationController

  def index
    @trailers=Unirest.get("http://api.traileraddict.com/?featured=yes&count=10").body
   
    #p @trailers.split("embed", "/embed").to_s

    if params[:search]
      @movies =Unirest.get("http://api.traileraddict.com/?featured=yes&count=10").body
      @movies= @movies.where('title LIKE ?', "%" + params[:search] + "%")
    end
  end
end