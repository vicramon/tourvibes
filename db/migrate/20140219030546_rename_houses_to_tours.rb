class RenameHousesToTours < ActiveRecord::Migration
  def change
    rename_table :houses, :tours
    rename_column :uploads, :house_id, :tour_id
  end
end
