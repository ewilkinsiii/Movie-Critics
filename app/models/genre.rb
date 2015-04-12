class Genre < ActiveRecord::Base
  has_many :sub_genres
  belongs_to :genes_alger
end
