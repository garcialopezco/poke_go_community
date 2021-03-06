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

ActiveRecord::Schema.define(version: 2018_08_27_224525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "lat"
    t.string "long"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raids", force: :cascade do |t|
    t.bigint "gym_id"
    t.string "boss"
    t.datetime "time"
    t.integer "remaining_time", default: 44
    t.boolean "expired", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.index ["gym_id"], name: "index_raids_on_gym_id"
  end

  create_table "raids_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "raid_id", null: false
    t.index ["raid_id", "user_id"], name: "index_raids_users_on_raid_id_and_user_id"
    t.index ["user_id", "raid_id"], name: "index_raids_users_on_user_id_and_raid_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "trainer_phone_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "raids", "gyms"
end
