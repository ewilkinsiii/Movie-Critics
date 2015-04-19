class MovieGenre < ActiveRecord::Base
  belongs_to :movie 
  belongs_to :genre
  has_many :ratings, :through => :movies
end
