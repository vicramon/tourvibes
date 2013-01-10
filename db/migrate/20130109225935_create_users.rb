class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :password
      t.string :salt
      t.string :stripe_id
      t.string :cell
      t.text :firm_name

      t.timestamps
    end
  end
end
