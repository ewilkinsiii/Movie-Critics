class MoviesController < ApplicationController
 before_action :authenticate_admin!, :only => [:edit, :destroy]

  def index
    @movies = Movie.all

    if params[:search]
      @movies= Movie.where('title LIKE ?', "%" + params[:search] + "%")
    elsif params[:category]
      # @movies = Movie.where("category like ?", "%#{params[:category]}%")
      genre= Genre.find_by(:category => params[:category])
      @movies = genre.movies
    end

    if params[:sort] == "by_name" 
      @movies = @movies.title(params[:sort] => params[:direction])
    end
    # @movies=Unirest.get("#{ENV['API_BASE_URL']}").body["movies"]
    # p "JSON STUFF:"
    
    
    # if params[:search]
    #   @movies =Unirest.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=title&page_limit=10&page=1&apikey=evhe76cqf8at2mzkhby5whdv").body["movie"]
    #   @movies= @movies.where('title LIKE ?', "%" + params[:search] + "%")
    # end
  end

  def show

    @movie = Movie.find(params[:id])

    @cast = Cast.where(movie_id: params[:id]).all

    @movie_mbd = Tmdb::Movie.detail(params[:id])
    @images = Tmdb::Movie.images(params[:id])
    score = Rating.find_by(:movie_id=>params[:id], :user_id => current_user.id).score
    p params[:id]
    @critics = User.joins(:ratings).where(:ratings => {:score=> score, :movie_id => params[:id]})
    #@cast = Tmdb::Movie.casts(params[:id])
    @trailers = Tmdb::Movie.trailers(params[:id])
    @similar_movies = Tmdb::Movie.similar_movies(params[:id])
    #@critic = User.where(:movie_id params[:id], )
    # @movie = Movie.find(params[:id])
    # # @movie = Movie.new(movie_data)
    # p "Movie.new#{@movie}"
  end

  def create
    @movie= Movie.new({:id => params[:id],:title => params[:title], :description => params[:description], :director_first_name => params[:director_first_name], :director_last_name => params[:director_last_name], :imdb_id => params[:imdb_id], :year => params[:year],:release_date => params[:release_date],:mpaa_rating => params[:mpaa_rating],:run_time => params[:run_time],:thumbnail => params[:thumbnail],:poster => params[:poster]})
    if @movie.valid?
       @movie.save
      flash[:success] = "Movie added!"
      redirect_to "/movies/#{@movie.id}"
    else
     flash[:info]= "Yon will have fill out all of the field in order to save your movie."
      render "new"
    end

    @cast = Cast.new({:first_name => params[:first_name],:last_name => params[:last_name],:image => params[:image]})
    if @cast.valid?
      @cast.save
      flash[:success] = "Cast added!"
      redirect_to "/movies/#{@movie.id}"
    else
      flash[:info]= "Yon will have fill out all of the field in order to save your movie."
      render "new"
    end

    @trailer=Trailer.new({:trailer => params[:embed]})
    if @cast.valid?
      @cast.save
      flash[:success] = "Trailer added!"
      redirect_to "/movies/#{@movie.id}"
    end
  end

  def new
    @movie= Movie.new
  end

  def edit
    if user_signed_in? && current_user.admin
      @movie= Movie.find(params[:id])
    else
     flash[:warning] = "You aren't authorized to take that action!"
     redirect_to "/"
    end
  end

  def update
    movie= Movie.find(params[:id])

    movie.update({:id => params[:id],:title => params[:title], :description => params[:description], :director_first_name => params[:director_first_name], :director_last_name => params[:director_last_name], :imdb_id => params[:imdb_id], :year => params[:year],:release_date => params[:release_date],:mpaa_rating => params[:mpaa_rating],:run_time => params[:run_time],:thumbnail => params[:thumbnail],:poster => params[:poster]})
    flash[:success] = "Movie updated!"
    redirect_to movie_path(@movie.id)

   cast.update({:first_name => params[:first_name],:last_name => params[:last_name],:image => params[:image]})

   trailer.update({:trailer => params[:embed]})
  end
  
  def destroy
    @movie= Movie.find(params[:id])
    @Movie.destroy
    flash[:danger] = "You've Destroyed the Movie!"
    @cast= Cast.find(params[:id])
    @cast.destroy
    flash[:danger] = "You've Destroyed the Movie!"
    @trailer= Trailer.find(params[:id])
    @trailer.destroy
    flash[:danger] = "You've Destroyed the trailer!"
    redirect_to Movies_path
  end

  private

  def authinicate_admin!
    if !(user_signed_in? && current_user.admin)
     flash[:warning] = "Please don't do that, wonderful person!"
     redirect_to "/"
    end
  end
end
