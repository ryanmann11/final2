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

ActiveRecord::Schema.define(version: 0) do

  create_table "cases", force: true do |t|
    t.string  "name"
    t.string  "image"
    t.text    "summary"
    t.string  "difficulty"
    t.string  "topic"
    t.integer "firm_id"
  end

  add_index "cases", ["firm_id"], name: "index_cases_on_firm_id"

  create_table "firms", force: true do |t|
    t.string "name"
  end

  create_table "givers", force: true do |t|
    t.string  "name"
    t.integer "case_id"
  end

  add_index "givers", ["case_id"], name: "index_givers_on_case_id"

  create_table "reviews", force: true do |t|
    t.integer "user_id"
    t.integer "rating"
    t.text    "body"
    t.integer "case_id"
  end

  add_index "reviews", ["case_id"], name: "index_reviews_on_case_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "sponsors", force: true do |t|
    t.integer "case_id"
    t.integer "giver_id"
  end

  add_index "sponsors", ["case_id"], name: "index_sponsors_on_case_id"
  add_index "sponsors", ["giver_id"], name: "index_sponsors_on_giver_id"

  create_table "users", force: true do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
  end

end
