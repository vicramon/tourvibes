class RenameIsLiveToLive < ActiveRecord::Migration
  def change
    rename_column :tours, :is_live, :live
  end
end
