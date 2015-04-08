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

ActiveRecord::Schema.define(version: 20150408175803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "db_user_id"
    t.string "encrypted_db_access_token"
    t.string "encrypted_db_access_token_salt"
    t.string "encrypted_db_access_token_iv"
    t.string "db_display_name"
    t.string "db_email"
  end

  add_index "users", ["db_user_id"], name: "index_users_on_db_user_id", unique: true, using: :btree

end
