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

ActiveRecord::Schema.define(version: 20170227212531) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "capacity"
    t.string   "integer"
    t.decimal  "max_points"
    t.boolean  "meeting"
    t.integer  "contact"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "UIN"
    t.string  "name"
    t.integer "phone"
    t.string  "email"
    t.text    "address"
    t.string  "classification"
    t.string  "major"
    t.string  "shirt"
    t.boolean "gender"
    t.boolean "officer"
    t.boolean "active"
  end

end