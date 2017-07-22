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

ActiveRecord::Schema.define(version: 20170630233726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "hours"
    t.string   "description"
    t.integer  "week_id"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["group_id"], name: "index_events_on_group_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
    t.index ["week_id"], name: "index_events_on_week_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "send_to"
    t.integer  "group_id"
    t.index ["group_id"], name: "index_messages_on_group_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "titles", force: :cascade do |t|
    t.string   "title"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_titles_on_group_id", using: :btree
    t.index ["user_id"], name: "index_titles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "manager"
    t.integer  "group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
  end

  create_table "weeks", force: :cascade do |t|
    t.integer  "number"
    t.string   "week_of"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_weeks_on_group_id", using: :btree
  end

  add_foreign_key "events", "groups"
  add_foreign_key "events", "users"
  add_foreign_key "events", "weeks"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "titles", "groups"
  add_foreign_key "titles", "users"
  add_foreign_key "users", "groups"
  add_foreign_key "weeks", "groups"
end
