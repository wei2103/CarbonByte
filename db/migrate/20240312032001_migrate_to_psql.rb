class MigrateToPsql < ActiveRecord::Migration[7.0]
  def change
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
    end
end