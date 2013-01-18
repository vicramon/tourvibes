class AddFieldsToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :brand, :string
  end
end
