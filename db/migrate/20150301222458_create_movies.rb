class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :string
      t.string :director
      t.string :string
      t.string :genre_id
      t.string :integer
      t.string :description
      t.string :text

      t.timestamps null: false
    end
  end
end
