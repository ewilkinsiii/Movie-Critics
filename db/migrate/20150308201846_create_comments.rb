class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating_id
      t.text :comments

      t.timestamps null: true
    end
  end
end
