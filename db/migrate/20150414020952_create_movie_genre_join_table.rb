class CreateMovieGenreJoinTable < ActiveRecord::Migration
  def change
    create_join_table :movies, :genres
  end
end
