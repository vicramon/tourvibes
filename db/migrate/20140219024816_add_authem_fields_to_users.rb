class AddAuthemFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :session_token, :string
    remove_column :users, :password, :string
  end
end
