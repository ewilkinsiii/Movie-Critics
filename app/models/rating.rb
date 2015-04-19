class Rating < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :movie
  has_many :genres, :through => :movie_genres
  #belongs_to :movie_genre, :through => :movie
end
