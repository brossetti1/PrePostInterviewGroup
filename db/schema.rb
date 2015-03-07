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

ActiveRecord::Schema.define(version: 20150307150745) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city",             limit: 64
    t.string   "state",            limit: 64
    t.string   "zipcode",          limit: 16
    t.string   "country",          limit: 64
    t.string   "full_address"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "first_name",      limit: 64
    t.string   "last_name",       limit: 64
    t.string   "title",           limit: 64
    t.string   "email",           limit: 64
    t.string   "phone",           limit: 32
    t.string   "mobile",          limit: 32
    t.boolean  "do_not_call",                 default: false
    t.string   "background_info", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.text     "research"
    t.text     "key_findings"
    t.text     "takeaways"
    t.text     "outcome"
    t.boolean  "thankyou_note", default: false
    t.boolean  "follow_up",     default: false
    t.boolean  "referral",      default: false
    t.boolean  "feedback",      default: false
    t.boolean  "business_card", default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "job_title"
    t.string   "lead_source"
    t.string   "pro"
    t.string   "con"
    t.text     "short_summary"
    t.integer  "salary"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
