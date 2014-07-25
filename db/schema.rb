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

ActiveRecord::Schema.define(version: 20140724062534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "username"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "campuses", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  create_table "categories_events", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "event_id"
  end

  add_index "categories_events", ["category_id", "event_id"], name: "index_categories_events_on_category_id_and_event_id", unique: true, using: :btree

  create_table "categories_users", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "user_id"
  end

  add_index "categories_users", ["category_id", "user_id"], name: "index_categories_users_on_category_id_and_user_id", unique: true, using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "domains", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains_events", id: false, force: true do |t|
    t.integer "domain_id"
    t.integer "event_id"
  end

  add_index "domains_events", ["domain_id", "event_id"], name: "index_domains_events_on_domain_id_and_event_id", unique: true, using: :btree

  create_table "domains_groups", id: false, force: true do |t|
    t.integer "domain_id"
    t.integer "group_id"
  end

  add_index "domains_groups", ["domain_id", "group_id"], name: "index_domains_groups_on_domain_id_and_group_id", unique: true, using: :btree

  create_table "domains_users", id: false, force: true do |t|
    t.integer "domain_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "domains_users", ["domain_id", "user_id"], name: "index_domains_users_on_domain_id_and_user_id", unique: true, using: :btree

  create_table "eligibles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eligibles_events", id: false, force: true do |t|
    t.integer "eligible_id"
    t.integer "event_id"
  end

  add_index "eligibles_events", ["eligible_id", "event_id"], name: "index_eligibles_events_on_eligible_id_and_event_id", unique: true, using: :btree

  create_table "eligibles_users", id: false, force: true do |t|
    t.integer "eligible_id"
    t.integer "user_id"
  end

  add_index "eligibles_users", ["eligible_id", "user_id"], name: "index_eligibles_users_on_eligible_id_and_user_id", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "organizer"
    t.string   "location"
    t.datetime "sdatetime"
    t.datetime "edatetime"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "email"
    t.text     "events_description"
    t.string   "short_description"
    t.string   "venue"
    t.string   "web"
    t.integer  "user_id"
    t.integer  "campus_id"
    t.integer  "group_id"
    t.integer  "reach_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "workflow_state"
    t.string   "slug"
  end

  add_index "events", ["campus_id"], name: "index_events_on_campus_id", using: :btree
  add_index "events", ["group_id"], name: "index_events_on_group_id", using: :btree
  add_index "events", ["reach_id"], name: "index_events_on_reach_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  add_index "favorites", ["user_id", "event_id"], name: "index_favorites_on_user_id_and_event_id", unique: true, using: :btree

  create_table "followfeeds", force: true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  add_index "followfeeds", ["user_id", "event_id"], name: "index_followfeeds_on_user_id_and_event_id", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "groups", force: true do |t|
    t.string  "name"
    t.string  "slug"
    t.text    "description"
    t.string  "short_name"
    t.integer "campus_id"
    t.string  "contact_name"
    t.integer "contact_phone"
    t.string  "email"
  end

  add_index "groups", ["campus_id"], name: "index_groups_on_campus_id", using: :btree

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "reaches", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", unique: true, using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "set_alerts", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "fbpush_id"
    t.string   "gcpush_id"
    t.string   "gcpush_htmllink"
    t.string   "fbpush_htmllink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "set_alerts", ["user_id", "event_id"], name: "index_set_alerts_on_user_id_and_event_id", unique: true, using: :btree

  create_table "shares", force: true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  add_index "shares", ["user_id", "event_id"], name: "index_shares_on_user_id_and_event_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "campus_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "image"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role",                   default: "guest"
    t.string   "aboutme"
    t.string   "slug"
  end

  add_index "users", ["campus_id"], name: "index_users_on_campus_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
