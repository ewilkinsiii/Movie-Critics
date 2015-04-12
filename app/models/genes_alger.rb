class GenesAlger < ActiveRecord::Base
  has_many :movies
  has_many :user
  has_many :sub_genres
  has_many :genres
end
