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

ActiveRecord::Schema.define(version: 20150131190138) do

  create_table "activities", force: true do |t|
    t.string   "name",                                      null: false
    t.text     "description"
    t.datetime "begin_date",                                null: false
    t.datetime "end_date"
    t.integer  "activity_type",                             null: false
    t.string   "place"
    t.string   "poster_photo_url"
    t.string   "banner_photo_url"
    t.integer  "num_available_places"
    t.float    "registration_fee_in_euros"
    t.text     "prizes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_free",                   default: true,  null: false
    t.boolean  "has_prizes",                default: false, null: false
  end

  create_table "activities_speakers", id: false, force: true do |t|
    t.integer "activity_id"
    t.integer "speaker_id"
  end

  add_index "activities_speakers", ["activity_id"], name: "index_activities_speakers_on_activity_id"
  add_index "activities_speakers", ["speaker_id"], name: "index_activities_speakers_on_speaker_id"

  create_table "activities_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "activity_id"
  end

  add_index "activities_users", ["activity_id"], name: "index_activities_users_on_activity_id"
  add_index "activities_users", ["user_id"], name: "index_activities_users_on_user_id"

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id"
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id"

  create_table "companies", force: true do |t|
    t.string   "name",                                null: false
    t.text     "description"
    t.string   "address"
    t.boolean  "is_partner",          default: false, null: false
    t.integer  "partnership_type"
    t.string   "web_site"
    t.string   "facebook_account"
    t.string   "twitter_account"
    t.string   "github_account"
    t.string   "google_plus_account"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editions", force: true do |t|
    t.string   "name"
    t.integer  "edition_number"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_actions", force: true do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: true do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: true do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: true do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", force: true do |t|
    t.string   "name",                null: false
    t.string   "email"
    t.string   "photo_url"
    t.text     "biography"
    t.string   "facebook_account"
    t.string   "twitter_account"
    t.string   "github_account"
    t.string   "google_plus_account"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "web_site"
    t.integer  "company_id"
  end

  add_index "speakers", ["company_id"], name: "index_speakers_on_company_id"

  create_table "users", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
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
    t.boolean  "is_student"
    t.boolean  "is_student_at_minho_univ"
    t.boolean  "is_inf_eng_student_at_minho_univ"
    t.boolean  "is_cesium_associate"
    t.integer  "cesium_associate_number"
    t.string   "minho_univ_student_id"
    t.string   "university"
    t.string   "course"
    t.string   "photo_url"
    t.string   "facebook_account"
    t.string   "twitter_account"
    t.string   "github_account"
    t.string   "google_plus_account"
    t.integer  "sash_id"
    t.integer  "level",                            default: 0
    t.boolean  "is_organizer"
    t.string   "organization_role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
