class AddPosters < ActiveRecord::Migration
  def change
    add_column :movies, :poster, :string
    add_column :movies, :thumbnail, :string
  end
end
