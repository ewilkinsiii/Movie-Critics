class Rating < ActiveRecord::Base
  has_many :comment
  belongs_to :user
  belongs_to :movie
  belongs_to :genes_alger
end
