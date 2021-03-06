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

ActiveRecord::Schema.define(version: 20170417221405) do

  create_table "admins", force: :cascade do |t|
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "UIN"
    t.boolean  "car_ride"
    t.text     "comments"
    t.boolean  "wait_listed"
    t.integer  "event_id"
    t.datetime "time_stamp"
    t.boolean  "approved"
    t.string   "pref_contact"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.date     "date"
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "capacity"
    t.float    "max_points"
    t.boolean  "meeting"
    t.string   "contact"
    t.string   "image"
    t.boolean  "publish"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer  "event_id"
    t.float    "points"
    t.integer  "UIN"
    t.datetime "issue_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "UIN"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "address"
    t.string   "classification"
    t.string   "major"
    t.string   "shirt"
    t.string   "gender"
    t.boolean  "officer"
    t.boolean  "active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
