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

ActiveRecord::Schema.define(version: 20161105170303) do

  create_table "plans", force: :cascade do |t|
    t.string   "name",                           null: false
    t.float    "price",                          null: false
    t.string   "paypal_description"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trial_length",       default: 0, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "paypal_payer_id"
    t.string   "paypal_profile_id"
    t.datetime "paid_until"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "canceled",          default: false, null: false
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
  end

end
