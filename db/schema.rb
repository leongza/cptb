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

ActiveRecord::Schema.define(version: 20130502080403) do

  create_table "attachments", force: true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "cop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
    t.boolean  "verified",                default: false
  end

  create_table "cops", force: true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "badge"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rank"
    t.string   "helmet"
    t.string   "sex"
    t.string   "race"
  end

  create_table "cops_departments", id: false, force: true do |t|
    t.integer "cop_id",        null: false
    t.integer "department_id", null: false
  end

  add_index "cops_departments", ["cop_id", "department_id"], name: "index_cops_departments_on_cop_id_and_department_id", unique: true

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "address"
    t.string   "phone"
    t.string   "postalcode"
  end

  create_table "evidences", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cop_id"
  end

  create_table "rosters", force: true do |t|
    t.integer  "cop_id"
    t.integer  "department_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
