class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.text :address_1
      t.text :address_2
      t.text :city
      t.text :state
      t.string :zip
      t.integer :user_id
      t.text :title
      t.text :heading
      t.text :desc
      t.string :subdomain
      t.text :custom_domain
      t.boolean :is_paid, :default => false
      t.boolean :show_map, :default => false
      t.boolean :show_schools, :default => false
      t.boolean :show_flyer, :default => false
      t.boolean :show_realtor_info, :default => false

      t.timestamps
    end
  end
end
