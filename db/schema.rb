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

ActiveRecord::Schema[7.0].define(version: 2024_04_06_033020) do
  create_table "activities", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "carbon_emission"
    t.integer "type_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_activities_on_type_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name"
    t.string "climatiq_id"
    t.string "climatiq_unit_of_measurement"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "climatiq_unit_type"
  end

  create_table "contents", force: :cascade do |t|
    t.integer "user_id"
    t.string "content_type"
    t.string "content_link"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "target_completion_date"
    t.integer "carbon_emission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "user_preferences", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "activity_type_id", null: false
    t.index ["activity_type_id", "user_id"], name: "index_user_preferences_on_activity_type_id_and_user_id"
    t.index ["user_id", "activity_type_id"], name: "index_user_preferences_on_user_id_and_activity_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "activity_types", column: "type_id"
  add_foreign_key "activities", "users"
  add_foreign_key "contents", "users"
  add_foreign_key "goals", "users"
end
