class AddFieldsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :schools_url, :text
    add_column :houses, :autoplay, :boolean, :default => true
    add_column :houses, :transition, :string
    add_column :houses, :mode, :string
    add_column :houses, :ken_burns, :boolean, :default => true
  end
end
