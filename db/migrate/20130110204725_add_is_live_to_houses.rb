class AddIsLiveToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :is_live, :boolean, :default => false
  end
end
