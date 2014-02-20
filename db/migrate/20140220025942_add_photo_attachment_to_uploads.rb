class AddPhotoAttachmentToUploads < ActiveRecord::Migration
  def self.up
    add_attachment :uploads, :photo
  end

  def self.down
    remove_attachment :uploads, :photo
  end
end
