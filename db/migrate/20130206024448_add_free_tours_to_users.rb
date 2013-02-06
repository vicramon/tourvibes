class AddFreeToursToUsers < ActiveRecord::Migration
  def change
    add_column :users, :free_tours, :integer
  end
end
