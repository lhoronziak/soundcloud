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

ActiveRecord::Schema.define(version: 20171227111131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_directories_on_parent_id"
    t.index ["user_id"], name: "index_directories_on_user_id"
  end

  create_table "favourite_sounds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sound_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "directory_id"
    t.index ["directory_id"], name: "index_favourite_sounds_on_directory_id"
    t.index ["sound_id"], name: "index_favourite_sounds_on_sound_id"
    t.index ["user_id", "sound_id"], name: "index_favourite_sounds_on_user_id_and_sound_id", unique: true
    t.index ["user_id"], name: "index_favourite_sounds_on_user_id"
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "sounds", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.index ["name"], name: "index_sounds_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "directories", "directories", column: "parent_id"
  add_foreign_key "favourite_sounds", "directories"
end
