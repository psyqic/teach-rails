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

ActiveRecord::Schema.define(:version => 20120905145228) do

  create_table "attendances", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attendances_users", :id => false, :force => true do |t|
    t.integer "attendance_id"
    t.integer "user_id"
  end

  create_table "bonuses", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.integer  "sequence"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "project_types", :force => true do |t|
    t.string   "name"
    t.string   "file_extension"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.date     "due"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.integer  "project_type_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "submissions", :force => true do |t|
    t.text     "code"
    t.integer  "project_id",          :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "submission_date"
    t.integer  "user_id"
    t.datetime "submission_datetime"
    t.integer  "version"
    t.string   "file_name"
    t.binary   "tgz"
  end

  create_table "thumbs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "account_name"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "role"
  end

end
