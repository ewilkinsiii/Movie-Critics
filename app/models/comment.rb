class Comment < ActiveRecord::Base
  belongs_to :ratings
  belongs_to :user
  belongs_to :movie
end
