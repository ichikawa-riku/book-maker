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

ActiveRecord::Schema.define(version: 20190326101222) do

  create_table "bets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "points",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_bets_on_game_id", using: :btree
    t.index ["player_id"], name: "index_bets_on_player_id", using: :btree
    t.index ["user_id"], name: "index_bets_on_user_id", using: :btree
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                     null: false
    t.text     "detail",      limit: 65535
    t.datetime "closed_at",                                 null: false
    t.boolean  "is_closed",                 default: false, null: false
    t.boolean  "is_finished",               default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_owners_on_game_id", using: :btree
    t.index ["user_id"], name: "index_owners_on_user_id", using: :btree
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "game_id", null: false
    t.string  "name",    null: false
    t.integer "odds",    null: false
    t.index ["game_id"], name: "index_players_on_game_id", using: :btree
  end

  create_table "points", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "bet_id"
    t.integer  "point"
    t.text     "reason",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["bet_id"], name: "index_points_on_bet_id", using: :btree
    t.index ["user_id"], name: "index_points_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                 default: "", null: false
    t.text     "avater",                 limit: 65535,              null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bets", "games"
  add_foreign_key "bets", "players"
  add_foreign_key "bets", "users"
  add_foreign_key "owners", "games"
  add_foreign_key "owners", "users"
  add_foreign_key "players", "games"
  add_foreign_key "points", "bets"
  add_foreign_key "points", "users"
end
