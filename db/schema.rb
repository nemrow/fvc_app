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

ActiveRecord::Schema.define(:version => 20140316051243) do

  create_table "babysittings", :force => true do |t|
    t.integer  "family_id"
    t.string   "status"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.integer  "staff_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bosses", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "event_instances", :force => true do |t|
    t.integer  "event_id"
    t.integer  "week_id"
    t.datetime "min_date"
    t.datetime "max_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "families", :force => true do |t|
    t.string   "last_name"
    t.integer  "login_code"
    t.integer  "room_num"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "families_weeks", :force => true do |t|
    t.integer  "family_id"
    t.integer  "week_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "staffs", :force => true do |t|
    t.string   "name"
    t.integer  "login_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "weeks", :force => true do |t|
    t.integer  "week_num"
    t.datetime "min_date"
    t.datetime "max_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
