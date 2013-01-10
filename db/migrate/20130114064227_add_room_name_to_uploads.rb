class AddRoomNameToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :room_name, :text
  end
end
