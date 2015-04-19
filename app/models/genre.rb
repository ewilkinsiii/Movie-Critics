class Genre < ActiveRecord::Base
  has_many :sub_genres
  belongs_to :genes_alger
 # has_many :movie_genres
  has_many :movie_genres
  has_many :movies, :through => :movie_genres
end