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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120418021222) do

  create_table "entrants", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "number"
    t.integer  "vehicle_class_id"
    t.string   "vehicle_make"
    t.string   "vehicle_model"
    t.string   "vehicle_color"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "past_award_speed", :default => false
  end

  add_index "entrants", ["event_id", "vehicle_class_id"], :name => "index_entrants_on_event_id_and_vehicle_class_id"
  add_index "entrants", ["event_id"], :name => "index_entrants_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "award_speed", :default => 999
  end

  create_table "stations", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "station_code"
    t.string   "trap_1_name"
    t.string   "trapid_1"
    t.string   "trap_2_name"
    t.string   "trapid_2"
    t.string   "trap_3_name"
    t.string   "trapid_3"
    t.string   "trap_4_name"
    t.string   "trapid_4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stations", ["event_id"], :name => "index_stations_on_event_id"

  create_table "system_settings", :force => true do |t|
    t.integer  "event_id"
    t.integer  "min_time_diff"
    t.integer  "break_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trap_speeds", :force => true do |t|
    t.integer  "event_id"
    t.integer  "station_id"
    t.integer  "entrant_id"
    t.integer  "trapid"
    t.integer  "trap_num"
    t.decimal  "capture_time",  :precision => 16, :scale => 0
    t.boolean  "official_flag"
    t.boolean  "dup_flag"
    t.boolean  "invalid_flag"
    t.decimal  "speed",         :precision => 16, :scale => 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "force_dnf",                                    :default => false
    t.string   "comment"
  end

  add_index "trap_speeds", ["event_id", "station_id", "entrant_id"], :name => "index_trap_speeds_on_event_id_and_station_id_and_entrant_id"
  add_index "trap_speeds", ["event_id"], :name => "index_trap_speeds_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_level",                            :default => 99
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicle_classes", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.integer  "max_speed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_classes", ["event_id"], :name => "index_vehicle_classes_on_event_id"

end
