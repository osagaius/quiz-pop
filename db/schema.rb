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

ActiveRecord::Schema.define(version: 20150721042919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.boolean  "complete"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "turn"
    t.integer  "player1"
    t.integer  "player2"
    t.string   "winner"
    t.string   "loser"
    t.integer  "player_1_score",      default: 0
    t.integer  "player_2_score",      default: 0
    t.integer  "current_question"
    t.integer  "current_category"
    t.integer  "meter"
    t.boolean  "special_mode"
    t.text     "player_1_pieces",     default: [],                 array: true
    t.text     "player_2_pieces",     default: [],                 array: true
    t.boolean  "challenge"
    t.boolean  "streak",              default: false
    t.string   "reward"
    t.integer  "challenge_questions", default: [],                 array: true
    t.integer  "challenge_count"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "difficulty"
    t.string   "text"
    t.string   "correct_answer"
    t.string   "wrong_answer_1"
    t.string   "wrong_answer_2"
    t.string   "wrong_answer_3"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "category"
    t.integer  "question"
    t.integer  "current_question"
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "player"
    t.boolean  "complete"
    t.integer  "current_turn"
    t.integer  "correct"
    t.integer  "game_id"
  end

  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree

  create_table "statistics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "category"
    t.boolean  "correct"
    t.string   "question"
    t.integer  "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "admin",                  default: false
    t.string   "rpx_identifier"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "questions", "categories"
  add_foreign_key "rounds", "games"
end
