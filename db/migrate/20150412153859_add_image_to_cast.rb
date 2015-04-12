class AddImageToCast < ActiveRecord::Migration
  def change
    add_column :casts, :image, :string
  end
end
