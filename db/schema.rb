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

ActiveRecord::Schema.define(version: 20140608032710) do

  create_table "leagues", force: true do |t|
    t.string   "league_name"
    t.integer  "QB_start"
    t.integer  "RB_start"
    t.integer  "WR_start"
    t.integer  "TE_start"
    t.integer  "Flex_start"
    t.integer  "K_start"
    t.integer  "Def_start"
    t.float    "Start_percent"
    t.integer  "Teams"
    t.integer  "Budget"
    t.integer  "Bench"
    t.float    "PaTd"
    t.float    "PaYd"
    t.float    "PaInt"
    t.float    "RuTd"
    t.float    "RuYd"
    t.float    "Rec"
    t.float    "RecTd"
    t.float    "ReYd"
    t.float    "Fum"
    t.float    "Comp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "RB_starters"
    t.integer  "WR_starters"
    t.integer  "QB_starters"
    t.integer  "TE_starters"
    t.float    "RB_bench"
    t.float    "WR_bench"
    t.float    "QB_bench"
    t.float    "TE_bench"
    t.float    "RB_count"
    t.float    "WR_count"
    t.float    "QB_count"
    t.float    "TE_count"
    t.float    "K_count"
    t.float    "DEF_count"
    t.float    "Total_count"
    t.float    "Team_starter"
    t.float    "Total_budget"
    t.float    "StartVBD"
    t.float    "BenchVBD"
    t.float    "Bench_percent"
    t.float    "VBD_total"
    t.float    "Bench_total"
    t.float    "Start_total"
  end

  create_table "player_projections", force: true do |t|
    t.string   "player"
    t.string   "team"
    t.string   "position"
    t.integer  "completions"
    t.integer  "pass_yds"
    t.integer  "pass_td"
    t.integer  "interceptions"
    t.integer  "rush_yds"
    t.integer  "rush_td"
    t.integer  "receptions"
    t.integer  "rec_yds"
    t.integer  "rec_td"
    t.integer  "fumbles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string  "team"
    t.integer "bye_week"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
