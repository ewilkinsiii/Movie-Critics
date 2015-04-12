class UpdateGenesAlger < ActiveRecord::Migration
  def change
    change_table :genes_algers do |t|
      t.change :genre_id, :integer
      t.remove :integer
      t.change :movie_id, :integer
      t.change :user_id, :integer
    end
  end
end
