# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130114064227) do

  create_table "houses", :force => true do |t|
    t.text     "address_1"
    t.text     "address_2"
    t.text     "city"
    t.text     "state"
    t.string   "zip"
    t.integer  "user_id"
    t.text     "title"
    t.text     "heading"
    t.text     "desc"
    t.string   "subdomain"
    t.text     "custom_domain"
    t.boolean  "is_paid",           :default => false
    t.boolean  "show_map",          :default => false
    t.boolean  "show_schools",      :default => false
    t.boolean  "show_flyer",        :default => false
    t.boolean  "show_realtor_info", :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "is_live",           :default => false
    t.text     "schools_url"
    t.boolean  "autoplay",          :default => true
    t.string   "transition"
    t.string   "mode"
    t.boolean  "ken_burns",         :default => true
  end

  create_table "uploads", :force => true do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "house_id"
    t.text     "title"
    t.text     "room_name"
  end

  create_table "users", :force => true do |t|
    t.text     "name"
    t.text     "email"
    t.text     "password"
    t.string   "salt"
    t.string   "stripe_id"
    t.string   "cell"
    t.text     "firm_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
