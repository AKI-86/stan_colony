# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_05_12_051705) do

  create_table "a_tags", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "artist_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id", "artist_tag_id"], name: "index_a_tags_on_artist_id_and_artist_tag_id", unique: true
    t.index ["artist_id"], name: "index_a_tags_on_artist_id"
    t.index ["artist_tag_id"], name: "index_a_tags_on_artist_tag_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artist_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_artist_tags_on_name", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.text "introduction"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_artists_on_name", unique: true
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "topic_id", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false
    t.index ["topic_id"], name: "index_comments_on_topic_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_favorites_on_artist_id"
    t.index ["user_id", "artist_id"], name: "index_favorites_on_user_id_and_artist_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "group_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false
    t.index ["group_id"], name: "index_group_comments_on_group_id"
    t.index ["user_id"], name: "index_group_comments_on_user_id"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.boolean "is_admin_member", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_memberships_on_group_id"
    t.index ["user_id", "group_id"], name: "index_group_memberships_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_group_memberships_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "reportable_type", null: false
    t.integer "reportable_id", null: false
    t.text "reason", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "t_tags", force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "topic_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id", "topic_tag_id"], name: "index_t_tags_on_topic_id_and_topic_tag_id", unique: true
    t.index ["topic_id"], name: "index_t_tags_on_topic_id"
    t.index ["topic_tag_id"], name: "index_t_tags_on_topic_tag_id"
  end

  create_table "topic_genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_topic_genres_on_name", unique: true
  end

  create_table "topic_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_topic_tags_on_name", unique: true
  end

  create_table "topics", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "user_id", null: false
    t.integer "topic_genre_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id", "title"], name: "index_topics_on_artist_id_and_title", unique: true
    t.index ["artist_id"], name: "index_topics_on_artist_id"
    t.index ["topic_genre_id"], name: "index_topics_on_topic_genre_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.text "introduction"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
    t.string "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "a_tags", "artist_tags"
  add_foreign_key "a_tags", "artists"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "artists", "users"
  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "artists"
  add_foreign_key "favorites", "users"
  add_foreign_key "group_comments", "groups"
  add_foreign_key "group_comments", "users"
  add_foreign_key "group_memberships", "groups"
  add_foreign_key "group_memberships", "users"
  add_foreign_key "groups", "users", column: "owner_id"
  add_foreign_key "relationships", "users", column: "followed_id"
  add_foreign_key "relationships", "users", column: "follower_id"
  add_foreign_key "reports", "users"
  add_foreign_key "t_tags", "topic_tags"
  add_foreign_key "t_tags", "topics"
  add_foreign_key "topics", "artists"
  add_foreign_key "topics", "topic_genres"
  add_foreign_key "topics", "users"
end
