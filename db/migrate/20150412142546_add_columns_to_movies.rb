class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :imdb_id, :integer
    add_column :movies, :year, :integer
    add_column :movies, :release_date, :integer
    add_column :movies, :mpaa_rating, :string
    add_column :movies, :run_time, :integer
  end
end
