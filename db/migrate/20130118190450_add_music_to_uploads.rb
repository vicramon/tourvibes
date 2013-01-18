class AddMusicToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :music_file_name, :string
    add_column :uploads, :music_content_type, :string
    add_column :uploads, :music_file_size, :integer
    add_column :uploads, :music_updated_at, :datetime
  end
end
