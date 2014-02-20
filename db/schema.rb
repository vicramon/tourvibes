# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140220025942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tours", force: true do |t|
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
    t.boolean  "paid",              default: false
    t.boolean  "show_map",          default: false
    t.boolean  "show_schools",      default: false
    t.boolean  "show_flyer",        default: false
    t.boolean  "show_realtor_info", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "live",              default: false
    t.text     "schools_url"
    t.boolean  "autoplay",          default: true
    t.string   "transition"
    t.string   "mode"
    t.boolean  "ken_burns",         default: true
    t.boolean  "autoplay_music",    default: false
    t.string   "bg_color"
    t.string   "wrapper_color"
    t.string   "link_color"
    t.string   "text_color"
    t.integer  "music_file"
    t.string   "title_color"
  end

  create_table "uploads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
    t.text     "title"
    t.text     "room_name"
    t.string   "brand"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.string   "salt"
    t.string   "stripe_id"
    t.string   "cell"
    t.text     "firm_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_super_admin",       default: false
    t.integer  "free_tours",           default: 0
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.string   "session_token"
  end

end
