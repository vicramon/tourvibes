class RemoveFileFieldsFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :upload_file_name
    remove_column :uploads, :upload_content_type
    remove_column :uploads, :upload_file_size
    remove_column :uploads, :upload_updated_at
    remove_column :uploads, :music_file_name
    remove_column :uploads, :music_content_type
    remove_column :uploads, :music_file_size
    remove_column :uploads, :music_updated_at
  end
end
