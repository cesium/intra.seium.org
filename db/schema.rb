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

ActiveRecord::Schema.define(version: 20180201154534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name",                      limit: 255,                 null: false
    t.text     "description"
    t.datetime "begin_date",                                            null: false
    t.datetime "end_date"
    t.integer  "activity_type",                                         null: false
    t.string   "place",                     limit: 255
    t.string   "poster_photo_url",          limit: 255
    t.string   "banner_photo_url",          limit: 255
    t.integer  "num_available_places"
    t.float    "registration_fee_in_euros"
    t.text     "prizes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_free",                               default: true,  null: false
    t.boolean  "has_prizes",                            default: false, null: false
    t.integer  "edition_id"
    t.string   "url_escaped_name",          limit: 255, default: "",    null: false
  end

  add_index "activities", ["edition_id"], name: "index_activities_on_edition_id", using: :btree
  add_index "activities", ["url_escaped_name"], name: "index_activities_on_url_escaped_name", using: :btree

  create_table "activities_speakers", id: false, force: :cascade do |t|
    t.integer "activity_id"
    t.integer "speaker_id"
  end

  add_index "activities_speakers", ["activity_id"], name: "index_activities_speakers_on_activity_id", using: :btree
  add_index "activities_speakers", ["speaker_id"], name: "index_activities_speakers_on_speaker_id", using: :btree

  create_table "activities_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
  end

  add_index "activities_users", ["activity_id"], name: "index_activities_users_on_activity_id", using: :btree
  add_index "activities_users", ["user_id"], name: "index_activities_users_on_user_id", using: :btree

  create_table "badge_acquisitions", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.string   "code",                 limit: 255
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
    t.string   "name",                limit: 255
    t.text     "description"
    t.text     "category"
    t.integer  "edition_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_code_needed"
    t.datetime "expiration_date"
    t.string   "codename",            limit: 255, default: "", null: false
    t.integer  "badge_type",                      default: 0,  null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "parent_id"
  end

  add_index "badges", ["activity_id"], name: "index_badges_on_activity_id", using: :btree
  add_index "badges", ["badge_type"], name: "index_badges_on_badge_type", using: :btree
  add_index "badges", ["codename"], name: "index_badges_on_codename", unique: true, using: :btree
  add_index "badges", ["edition_id"], name: "index_badges_on_edition_id", using: :btree
  add_index "badges", ["parent_id"], name: "index_badges_on_parent_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                limit: 255,                 null: false
    t.text     "description"
    t.string   "address",             limit: 255
    t.boolean  "is_partner",                      default: false, null: false
    t.integer  "partnership_type"
    t.string   "web_site",            limit: 255
    t.string   "facebook_account",    limit: 255
    t.string   "twitter_account",     limit: 255
    t.string   "github_account",      limit: 255
    t.string   "google_plus_account", limit: 255
    t.string   "logo_url",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_editions", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.integer "edition_id"
  end

  add_index "companies_editions", ["company_id"], name: "index_companies_editions_on_company_id", using: :btree
  add_index "companies_editions", ["edition_id"], name: "index_companies_editions_on_edition_id", using: :btree

  create_table "editions", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "edition_number"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editions_speakers", id: false, force: :cascade do |t|
    t.integer "edition_id"
    t.integer "speaker_id"
  end

  add_index "editions_speakers", ["edition_id"], name: "index_editions_speakers_on_edition_id", using: :btree
  add_index "editions_speakers", ["speaker_id"], name: "index_editions_speakers_on_speaker_id", using: :btree

  create_table "editions_users", id: false, force: :cascade do |t|
    t.integer "edition_id"
    t.integer "user_id"
  end

  add_index "editions_users", ["edition_id"], name: "index_editions_users_on_edition_id", using: :btree
  add_index "editions_users", ["user_id"], name: "index_editions_users_on_user_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "name",                limit: 255, null: false
    t.string   "email",               limit: 255
    t.string   "photo_url",           limit: 255
    t.text     "biography"
    t.string   "facebook_account",    limit: 255
    t.string   "twitter_account",     limit: 255
    t.string   "github_account",      limit: 255
    t.string   "google_plus_account", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                limit: 255
    t.string   "web_site",            limit: 255
    t.integer  "company_id"
  end

  add_index "speakers", ["company_id"], name: "index_speakers_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                            limit: 255, default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",               limit: 255
    t.string   "last_sign_in_ip",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                       limit: 255
    t.string   "last_name",                        limit: 255
    t.datetime "birthday"
    t.text     "biography"
    t.boolean  "is_univ_student"
    t.boolean  "is_student_at_minho_univ"
    t.boolean  "is_inf_eng_student_at_minho_univ"
    t.boolean  "is_cesium_associate"
    t.integer  "cesium_associate_number"
    t.string   "minho_univ_student_id",            limit: 255
    t.string   "university",                       limit: 255
    t.string   "course",                           limit: 255
    t.string   "facebook_account",                 limit: 255
    t.string   "twitter_account",                  limit: 255
    t.string   "github_account",                   limit: 255
    t.string   "google_plus_account",              limit: 255
    t.boolean  "is_organizer",                                 default: false
    t.string   "organizer_role",                   limit: 255
    t.string   "username",                         limit: 255
    t.integer  "sex"
    t.string   "avatar_file_name",                 limit: 255
    t.string   "avatar_content_type",              limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "linked_in_account",                limit: 255
    t.string   "location",                         limit: 255
    t.string   "profession",                       limit: 255
    t.integer  "badge_acquisitions_count",                     default: 0
    t.boolean  "is_badge_manager",                             default: false
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
