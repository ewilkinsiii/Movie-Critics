class SubGenre < ActiveRecord::Base
  belong_to :genre
  belongs_to :genes_alger
end
