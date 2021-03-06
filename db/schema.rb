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

ActiveRecord::Schema.define(version: 2018_11_07_014838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string "band_name", null: false
    t.string "bandcamp_url"
    t.string "genre", default: "N/A"
    t.string "band_bio"
    t.string "band_image"
  end

  create_table "bookers", force: :cascade do |t|
    t.string "organization_name"
    t.string "booker_bio"
    t.string "booker_image"
  end

  create_table "concerts", force: :cascade do |t|
    t.datetime "date_and_time", null: false
    t.string "location", null: false
    t.string "description"
    t.string "title"
    t.bigint "booker_id", null: false
    t.bigint "user_id"
    t.index ["booker_id"], name: "index_concerts_on_booker_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "band_id", null: false
    t.bigint "concert_id", null: false
    t.index ["band_id"], name: "index_listings_on_band_id"
    t.index ["concert_id"], name: "index_listings_on_concert_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_photo"
    t.bigint "band_id"
    t.bigint "booker_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
