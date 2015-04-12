class AddCharactersNameToCast < ActiveRecord::Migration
  def change
    add_column :casts, :characters_name, :string
  end
end
