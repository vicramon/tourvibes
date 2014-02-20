class RenameIsPaidToPaid < ActiveRecord::Migration
  def change
    rename_column :tours, :is_paid, :paid
  end
end
