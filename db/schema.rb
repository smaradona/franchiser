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

ActiveRecord::Schema.define(version: 20150522125902) do

  create_table "franchises", force: :cascade do |t|
    t.string   "owner_name",   limit: 255
    t.string   "owner_phone",  limit: 255
    t.string   "owner_email",  limit: 255
    t.string   "province",     limit: 255
    t.string   "zone",         limit: 255
    t.string   "address",      limit: 255
    t.string   "zip_code",     limit: 255
    t.string   "area_code",    limit: 255
    t.string   "phone_number", limit: 255
    t.string   "email",        limit: 255
    t.decimal  "latitude",                   precision: 15, scale: 10
    t.decimal  "longitude",                  precision: 15, scale: 10
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "area",         limit: 65535
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

end
