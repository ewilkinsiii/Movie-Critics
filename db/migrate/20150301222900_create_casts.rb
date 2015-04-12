class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.string :actor_type
      t.string :string
      t.string :movie_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
