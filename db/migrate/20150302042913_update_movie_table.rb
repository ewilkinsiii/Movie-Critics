class UpdateMovieTable < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.change :genre_id, :integer
      t.remove :integer
      t.change :description, :text
      t.remove :text
    end
  end
end
