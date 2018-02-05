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

ActiveRecord::Schema.define(version: 20180206121415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badge_acquisitions", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.string   "code"
    t.integer  "status"
    t.datetime "code_expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "acquisition_date"
  end

  add_index "badge_acquisitions", ["badge_id"], name: "index_badge_acquisitions_on_badge_id", using: :btree
  add_index "badge_acquisitions", ["code"], name: "index_badge_acquisitions_on_code", using: :btree
  add_index "badge_acquisitions", ["user_id"], name: "index_badge_acquisitions_on_user_id", using: :btree

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "category"
    t.integer  "edition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_code_needed"
    t.datetime "expiration_date"
    t.string   "codename",            default: "", null: false
    t.integer  "badge_type",          default: 0,  null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "parent_id"
  end

  add_index "badges", ["badge_type"], name: "index_badges_on_badge_type", using: :btree
  add_index "badges", ["codename"], name: "index_badges_on_codename", unique: true, using: :btree
  add_index "badges", ["edition_id"], name: "index_badges_on_edition_id", using: :btree
  add_index "badges", ["parent_id"], name: "index_badges_on_parent_id", using: :btree

  create_table "editions", force: :cascade do |t|
    t.string   "name"
    t.integer  "edition_number"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birthday"
    t.text     "biography"
    t.boolean  "is_univ_student"
    t.boolean  "is_student_at_minho_univ"
    t.boolean  "is_inf_eng_student_at_minho_univ"
    t.boolean  "is_cesium_associate"
    t.integer  "cesium_associate_number"
    t.string   "minho_univ_student_id"
    t.string   "university"
    t.string   "course"
    t.string   "facebook_account"
    t.string   "twitter_account"
    t.string   "github_account"
    t.boolean  "is_organizer",                     default: false
    t.string   "organizer_role"
    t.string   "username"
    t.integer  "sex"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "linked_in_account"
    t.string   "location"
    t.string   "profession"
    t.integer  "badge_acquisitions_count",         default: 0
    t.boolean  "is_badge_manager",                 default: false
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
