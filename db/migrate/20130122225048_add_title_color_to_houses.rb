class AddTitleColorToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :title_color, :string
  end
end
