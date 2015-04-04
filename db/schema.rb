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

ActiveRecord::Schema.define(version: 20150404155108) do

  create_table "event_type_plans", force: true do |t|
    t.integer  "event_type_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_type_plans", ["event_type_id"], name: "index_event_type_plans_on_event_type_id"
  add_index "event_type_plans", ["plan_id"], name: "index_event_type_plans_on_plan_id"

  create_table "event_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "event_type_id"
    t.boolean  "completed"
    t.string   "text"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "plans", force: true do |t|
    t.string   "name"
    t.integer  "limit"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.boolean  "admin"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "number"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["plan_id"], name: "index_users_on_plan_id"

end
