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

ActiveRecord::Schema.define(:version => 20110923231018) do

  create_table "add_approvalflag_to_merchants", :force => true do |t|
    t.boolean  "Flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allcourses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", :force => true do |t|
    t.string   "userMessage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "courseCode"
    t.string   "session",         :limit => 1
    t.integer  "area"
    t.text     "description"
    t.string   "prerequisites"
    t.string   "corequisites"
    t.float    "lectureHours"
    t.float    "labHours"
    t.float    "tutorialHours"
    t.string   "discipline"
    t.text     "antiDescription"
    t.string   "areaName"
    t.string   "kernel"
    t.string   "exclusion"
    t.string   "year"
  end

  create_table "d_thread_ratings", :force => true do |t|
    t.integer  "d_thread_id"
    t.integer  "likes"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_thread_reply_ratings", :force => true do |t|
    t.integer  "reply_id"
    t.integer  "user_id"
    t.integer  "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_threads", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.integer  "course_id"
    t.text     "question"
    t.string   "courseCode"
    t.string   "tg"
    t.integer  "user_id"
  end

  create_table "eces", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "Area"
    t.string   "Prerequisites"
    t.string   "Lecturehours"
    t.string   "Labhours"
    t.string   "Tutorialhours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_code"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "d_thread_id"
    t.integer  "likes"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", :force => true do |t|
    t.string   "Name"
    t.string   "UserName"
    t.string   "RegistrationName"
    t.string   "BusinessName"
    t.string   "ContactPerson"
    t.string   "PhoneNumber"
    t.string   "Fax"
    t.string   "BusinessAdress"
    t.string   "Email"
    t.string   "Website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Flag"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "stateField"
    t.string   "zipcode"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "replies", :force => true do |t|
    t.integer  "d_thread_id"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "states", :force => true do |t|
    t.string   "stateName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "d_thread_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "dob"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
