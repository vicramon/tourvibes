class AddAutoplayMusicToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :autoplay_music, :boolean, :default => false
  end
end
