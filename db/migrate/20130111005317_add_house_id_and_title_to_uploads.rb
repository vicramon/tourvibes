class AddHouseIdAndTitleToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :house_id, :integer
    add_column :uploads, :title, :text
  end
end
