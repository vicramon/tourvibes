class AddLoginHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_hash, :string
  end
end
