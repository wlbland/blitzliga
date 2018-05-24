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

ActiveRecord::Schema.define(version: 20180524185551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id"
    t.boolean "non_league", default: false
    t.bigint "season_id"
    t.index ["season_id"], name: "index_fixtures_on_season_id"
    t.index ["venue_id"], name: "index_fixtures_on_venue_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "team_score_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_goals_on_player_id"
    t.index ["team_score_id"], name: "index_goals_on_team_score_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "registered", default: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_fixtures", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "fixture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixture_id"], name: "index_team_fixtures_on_fixture_id"
    t.index ["team_id"], name: "index_team_fixtures_on_team_id"
  end

  create_table "team_scores", force: :cascade do |t|
    t.bigint "team_fixture_id"
    t.integer "total_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_fixture_id"], name: "index_team_scores_on_team_fixture_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "pitch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "pitch"], name: "index_venues_on_name_and_pitch", unique: true
  end

  add_foreign_key "fixtures", "seasons"
  add_foreign_key "fixtures", "venues"
  add_foreign_key "players", "teams"
  add_foreign_key "team_fixtures", "fixtures"
  add_foreign_key "team_fixtures", "teams"
  add_foreign_key "team_scores", "team_fixtures"
end
