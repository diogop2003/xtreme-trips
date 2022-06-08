# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_06_08_183346) do
=======
ActiveRecord::Schema.define(version: 2022_06_08_182645) do
>>>>>>> 5370ddfe3a4ae918a0988d703d5c7c99bc2fbebf

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
=======
  create_table "checkpoints", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.boolean "start_point"
    t.boolean "end_point"
    t.bigint "trail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_checkpoints_on_trail_id"
  end

  create_table "event_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

>>>>>>> 5370ddfe3a4ae918a0988d703d5c7c99bc2fbebf
  create_table "events", force: :cascade do |t|
    t.string "name"
    t.bigint "trail_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_events_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "mode"
    t.float "distance"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_trails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
    t.string "address"
    t.string "name"
    t.string "contact"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
=======
  add_foreign_key "checkpoints", "trails"
  add_foreign_key "event_users", "events"
  add_foreign_key "event_users", "users"
>>>>>>> 5370ddfe3a4ae918a0988d703d5c7c99bc2fbebf
  add_foreign_key "events", "trails"
  add_foreign_key "trails", "users"
end
