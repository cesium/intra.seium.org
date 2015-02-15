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


ActiveRecord::Schema.define(version: 20150212192910) do

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
    t.integer  "edition_id"
    t.string   "url_escaped_name",          default: "",    null: false
  end

  add_index "activities", ["edition_id"], name: "index_activities_on_edition_id"
  add_index "activities", ["url_escaped_name"], name: "index_activities_on_url_escaped_name"

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

  create_table "badge_acquisitions", force: true do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.string   "code"
    t.integer  "status"
    t.datetime "code_expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "acquisition_date"
  end

  add_index "badge_acquisitions", ["badge_id"], name: "index_badge_acquisitions_on_badge_id"
  add_index "badge_acquisitions", ["code"], name: "index_badge_acquisitions_on_code"
  add_index "badge_acquisitions", ["user_id"], name: "index_badge_acquisitions_on_user_id"

  create_table "badges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "category"
    t.integer  "edition_id"
    t.integer  "activity_id"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_code_needed"
    t.datetime "expiration_date"
    t.string   "codename",        default: "", null: false
    t.integer  "badge_type",      default: 0,  null: false
  end

  add_index "badges", ["activity_id"], name: "index_badges_on_activity_id"
  add_index "badges", ["badge_type"], name: "index_badges_on_badge_type"
  add_index "badges", ["codename"], name: "index_badges_on_codename", unique: true
  add_index "badges", ["edition_id"], name: "index_badges_on_edition_id"

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

  create_table "companies_editions", id: false, force: true do |t|
    t.integer "company_id"
    t.integer "edition_id"
  end

  add_index "companies_editions", ["company_id"], name: "index_companies_editions_on_company_id"
  add_index "companies_editions", ["edition_id"], name: "index_companies_editions_on_edition_id"

  create_table "editions", force: true do |t|
    t.string   "name"
    t.integer  "edition_number"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editions_speakers", id: false, force: true do |t|
    t.integer "edition_id"
    t.integer "speaker_id"
  end

  add_index "editions_speakers", ["edition_id"], name: "index_editions_speakers_on_edition_id"
  add_index "editions_speakers", ["speaker_id"], name: "index_editions_speakers_on_speaker_id"

  create_table "editions_users", id: false, force: true do |t|
    t.integer "edition_id"
    t.integer "user_id"
  end

  add_index "editions_users", ["edition_id"], name: "index_editions_users_on_edition_id"
  add_index "editions_users", ["user_id"], name: "index_editions_users_on_user_id"

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
    t.string   "email",                            default: "",    null: false
    t.string   "encrypted_password",               default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
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
    t.string   "google_plus_account"
    t.boolean  "is_organizer",                     default: false
    t.string   "organizer_role"
    t.string   "username"
    t.integer  "sex"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "linked_in_account"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
