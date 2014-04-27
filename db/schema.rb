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

ActiveRecord::Schema.define(version: 20140324183843) do

  create_table "choices", force: true do |t|
    t.integer  "page_init",              null: false
    t.integer  "page_fin",               null: false
    t.string   "text",                   null: false
    t.integer  "picked",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["page_fin"], name: "index_choices_on_page_fin"
  add_index "choices", ["page_init"], name: "index_choices_on_page_init"

  create_table "pages", force: true do |t|
    t.integer  "story_id"
    t.text     "text"
    t.string   "title"
    t.integer  "position"
    t.integer  "posx"
    t.integer  "posy"
    t.integer  "posz"
    t.integer  "readed",     default: 0
    t.boolean  "ending",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["position"], name: "index_pages_on_position"
  add_index "pages", ["story_id"], name: "index_pages_on_story_id"

  create_table "plots", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "story_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "title",                  null: false
    t.integer  "user_id",                null: false
    t.integer  "status",     default: 0, null: false
    t.integer  "readed",     default: 0, null: false
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["title"], name: "index_stories_on_title", unique: true
  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
