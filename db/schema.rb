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

ActiveRecord::Schema.define(version: 20150414020952) do

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "casts", force: :cascade do |t|
    t.string   "actor_type",      limit: 255
    t.integer  "movie_id",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "image",           limit: 255
    t.string   "characters_name", limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "rating_id",    limit: 4
    t.text     "comments",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "like_count",   limit: 4
    t.integer  "unlike_count", limit: 4
  end

  create_table "genes_algers", force: :cascade do |t|
    t.integer  "genre_id",   limit: 4
    t.integer  "movie_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", limit: 4, null: false
    t.integer "genre_id", limit: 4, null: false
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id",   limit: 4
    t.integer  "genre_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.integer  "genre_id",            limit: 4
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "director_first_name", limit: 255
    t.string   "director_last_name",  limit: 255
    t.integer  "imdb_id",             limit: 4
    t.integer  "year",                limit: 4
    t.integer  "release_date",        limit: 4
    t.string   "mpaa_rating",         limit: 255
    t.integer  "run_time",            limit: 4
    t.string   "poster",              limit: 255
    t.string   "thumbnail",           limit: 255
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "stars",         limit: 24,  null: false
    t.string   "dimension",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id",   limit: 4
    t.string   "cacheable_type", limit: 255
    t.float    "avg",            limit: 24,  null: false
    t.integer  "qty",            limit: 4,   null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "comment_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "score",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id",   limit: 4
  end

  add_index "ratings", ["comment_id"], name: "index_ratings_on_comment_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "sub_genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "genre_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trailers", force: :cascade do |t|
    t.string   "embed",      limit: 255
    t.integer  "movie_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  limit: 1,   default: false
    t.string   "image",                  limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
