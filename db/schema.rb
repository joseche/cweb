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

ActiveRecord::Schema.define(version: 5) do

  create_table "accounts", force: :cascade do |t|
    t.string   "api_token"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "activations", force: :cascade do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activations", ["user_id"], name: "index_activations_on_user_id"

  create_table "hosts", force: :cascade do |t|
    t.string   "fqdn"
    t.string   "signature"
    t.string   "clientip"
    t.string   "internalip"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hosts", ["account_id"], name: "index_hosts_on_account_id"

  create_table "tags", force: :cascade do |t|
    t.string   "tagname"
    t.integer  "host_id"
    t.boolean  "auto",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tags", ["host_id"], name: "index_tags_on_host_id"

  create_table "users", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "active",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
