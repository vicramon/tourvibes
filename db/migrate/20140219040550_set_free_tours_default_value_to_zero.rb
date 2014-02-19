class SetFreeToursDefaultValueToZero < ActiveRecord::Migration
  def change
    change_column_default :users, :free_tours, 0
  end
end
