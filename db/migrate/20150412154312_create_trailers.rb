class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :embed
      t.integer :movie_id 
      t.timestamps null: true
    end
  end
end
