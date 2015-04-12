class CreateGenesAlgers < ActiveRecord::Migration
  def change
    create_table :genes_algers do |t|
      t.string :genre_id
      t.string :integer
      t.string :movie_id
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
