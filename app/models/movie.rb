class Movie < ActiveRecord::Base
  #ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design', 'movie'
  #has_many :genres, :through => :movie_genres
  has_many :comments
  has_many :ratings
  belongs_to :genes_alger
  belongs_to :cast
  has_many :movie_genres
  has_many :genres, :through => :movie_genres

  #def critic
   # @critic = User.where(movie.rating.score)
  #attr_reader :id,:year, :mpaa_rating, :runtime, :critics_consensus, :release_dates, :theater, :ratings, :critics_ratings, :critics_score, :audience_rating, :audience_score, :synopsis, :posters, :thumbnail, :profile, :detailed, :original, :abridged_cast, :name, :characters, :alternate_ids, :imdb, :links, :alternate, :cast, :reviews, :similar, :title, :abridged_cast, :name, :characters, :alternate_ids, :imdb, :trailer
  def self.average_by_genre(category)
    average(:rating).where(:genre => genre)
  end
  
  # #def initialize(hash)
  #   #@id = hash["id"]
  #   @year = hash["year"]
  #   @title = hash["title"]
  #   @mpaa_rating = hash["mpaa_rating"] 
  #   @runtime = hash["runtime"]
  #   @critics_consensus = hash["critics_consensus"]
  #   @release_date = hash['release_date']
  #   @theater = hash['release_dates']["theater"]
  #   @posters = hash["posters"]
  #   @thumbnail = hash["posters"]["thumbnail"]
  #   @detailed = hash["posters"]["detailed"]
  #   @profile = hash["posters"]["profile"]
  #   @original =hash["posters"]["original"]
  #   @synopsis = hash["synopsis"]
  #   @critics_ratings = hash["critics_ratings"]
  #   @abridged_cast = hash["abridged_cast"]
  #   @alternate_ids = hash["alternate_ids"]
  #   @imdb = hash["alternate_ids"]["imdb"]
    #@name = hash["abridged_cast"][0]["name"]
    #@characters = hash["abridged_cast"][0]["characters"]
  # end

  # def self.all
  #   movies_array=Unirest.get("#{ENV['API_BASE_URL']}").body["movies"]
  #   movies=[]
  #   @movies.each do |movie|
  #     movies << (movies_array)
  #   end
  #   return movies
  # end

  # def self.find(id)
  #   movie_hash=Unirest.get("http://api.rottentomatoes.com/api/public/v1.0/movies/#{id}.json?apikey=#{ENV['API_SHOW_URL']}").body
  #   # @movie_core = Movie.new(movie_hash)
  #   return Movie.new(movie_hash)
  # end

  def trailer(title_name)
    request = Unirest.get("http://api.traileraddict.com/?film=#{title_name.downcase.gsub('?', '').gsub(': ', '-').gsub(' ', '-').gsub('kingsman', 'kingsmen')}").body
    # (/[/:/?]/, '?' => '',': ' => '-', ' ' => '-'}
      p  "http://api.traileraddict.com/?film=#{title_name.downcase.gsub(/[:? ]/, '?' => '',': ' => '-', ' ' => '-')}"
    embed_code = p Hash.from_xml(request)["trailers"]["trailer"]["embed"]
    return embed_code.html_safe
  end 
end
