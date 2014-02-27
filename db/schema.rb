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

ActiveRecord::Schema.define(:version => 20140224002959) do

  create_table "lift_ticket_scans", :force => true do |t|
    t.integer  "resort_id"
    t.integer  "ticket_id"
    t.datetime "timestamp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lift_tickets", :force => true do |t|
    t.integer  "issuer_id"
    t.integer  "season_id"
    t.integer  "state_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ski_resort_companies", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ski_resorts", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.integer  "scan_wait_seconds"
    t.string   "type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "ski_seasons", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ticket_states", :force => true do |t|
    t.integer  "ticket_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end