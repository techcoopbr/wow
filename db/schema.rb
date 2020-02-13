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

ActiveRecord::Schema.define(version: 20200210183106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "creator_id"
    t.string   "tags"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "creator_published"
    t.boolean  "admin_published"
    t.string   "short_description"
    t.string   "slug"
    t.string   "cover"
    t.integer  "views"
    t.integer  "impressions_count"
    t.boolean  "can_anonymous"
    t.index ["creator_id"], name: "index_blogs_on_creator_id", using: :btree
    t.index ["slug"], name: "index_blogs_on_slug", unique: true, using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "creator_tags", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_creator_tags_on_creator_id", using: :btree
    t.index ["tag_id"], name: "index_creator_tags_on_tag_id", using: :btree
  end

  create_table "creators", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "approved",          default: false
    t.text     "about"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "slug"
    t.string   "contact_address"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_file"
    t.string   "short_description"
    t.string   "publi_file"
    t.string   "stream_embed"
    t.string   "youtube_embed"
    t.string   "twitter_embed"
    t.string   "facebook_embed"
    t.string   "instagram_embed"
    t.string   "cover"
    t.string   "linkdin"
    t.string   "photo"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "twitch"
    t.string   "website"
    t.string   "podcast"
    t.string   "page_name"
    t.date     "page_create"
    t.string   "youtube"
    t.string   "instagram"
    t.string   "photo_box"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_photo"
    t.string   "script_google"
    t.integer  "impressions_count"
    t.index ["user_id"], name: "index_creators_on_user_id", using: :btree
  end

  create_table "developers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "about"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "about"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
  end

  create_table "meta", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "photo"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["creator_id"], name: "index_meta_on_creator_id", using: :btree
  end

  create_table "plataforms", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "about"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "blog_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_taggings_on_blog_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo"
    t.string   "role_id"
    t.text     "about"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "twitch"
    t.string   "website"
    t.string   "podcast"
    t.string   "page_name"
    t.date     "page_create"
    t.string   "name"
    t.string   "youtube"
    t.string   "intagram"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "blogs", "creators"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "creator_tags", "creators"
  add_foreign_key "creator_tags", "tags"
  add_foreign_key "creators", "users"
  add_foreign_key "meta", "creators"
  add_foreign_key "taggings", "blogs"
  add_foreign_key "taggings", "tags"
end
