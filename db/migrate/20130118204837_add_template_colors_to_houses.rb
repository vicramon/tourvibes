class AddTemplateColorsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :bg_color, :string
    add_column :houses, :wrapper_color, :string
    add_column :houses, :link_color, :string
    add_column :houses, :text_color, :string
    add_column :houses, :music_file, :integer
  end
end
