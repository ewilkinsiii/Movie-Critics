class CreateSubGenres < ActiveRecord::Migration
  def change
    create_table :sub_genres do |t|
      t.string :name
      t.string :string
      t.string :genre_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
