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

ActiveRecord::Schema.define(version: 20131231061457) do

  create_table "apis", force: true do |t|
    t.string   "ip"
    t.string   "imsi"
    t.string   "ecgi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_flags", force: true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_flags", ["message_id"], name: "index_message_flags_on_message_id"
  add_index "message_flags", ["user_id", "message_id"], name: "index_message_flags_on_user_id_and_message_id"
  add_index "message_flags", ["user_id"], name: "index_message_flags_on_user_id"

  create_table "messages", force: true do |t|
    t.string   "message"
    t.binary   "message_img"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "relations", force: true do |t|
    t.integer  "user_from"
    t.integer  "user_to"
    t.boolean  "event_entry"
    t.boolean  "event_exit"
    t.boolean  "event_post"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["user_from", "user_to"], name: "index_relations_on_user_from_and_user_to"
  add_index "relations", ["user_from"], name: "index_relations_on_user_from"
  add_index "relations", ["user_to"], name: "index_relations_on_user_to"

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "phone_no"
    t.string   "imsi"
    t.string   "ecgi"
    t.string   "description"
    t.binary   "profile_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
