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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110928164939) do

  create_table "badges_engine_assertions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.string   "evidence"
    t.date     "expires"
    t.date     "issued_on"
    t.string   "token"
    t.boolean  "is_baked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_engine_badges", :force => true do |t|
    t.integer  "issuer_id"
    t.string   "version"
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.string   "criteria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
