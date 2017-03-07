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

ActiveRecord::Schema.define(version: 20170306112431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "hut_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hut_id"], name: "index_availabilities_on_hut_id", using: :btree
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hut_equipments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "equipment_id"
    t.integer  "hut_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["equipment_id"], name: "index_hut_equipments_on_equipment_id", using: :btree
    t.index ["hut_id"], name: "index_hut_equipments_on_hut_id", using: :btree
  end

  create_table "huts", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "about"
    t.integer  "capacity"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_huts_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tribe_members", force: :cascade do |t|
    t.integer  "tribe_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tribe_id"], name: "index_tribe_members_on_tribe_id", using: :btree
    t.index ["user_id"], name: "index_tribe_members_on_user_id", using: :btree
  end

  create_table "tribes", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "short_desk"
    t.index ["user_id"], name: "index_tribes_on_user_id", using: :btree
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_user_skills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "phone_number"
    t.float    "average_rating"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availabilities", "huts"
  add_foreign_key "hut_equipments", "equipment"
  add_foreign_key "hut_equipments", "huts"
  add_foreign_key "huts", "users"
  add_foreign_key "tribe_members", "tribes"
  add_foreign_key "tribe_members", "users"
  add_foreign_key "tribes", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
