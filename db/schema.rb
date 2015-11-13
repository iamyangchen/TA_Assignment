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

ActiveRecord::Schema.define(version: 20151113053618) do

  create_table "app_course_matchings", force: :cascade do |t|
    t.integer  "student_application_id"
    t.integer  "course_id"
    t.integer  "application_pool_id"
    t.integer  "status"
    t.integer  "position"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "application_pools", force: :cascade do |t|
    t.string   "year"
    t.string   "semester"
    t.datetime "deadline"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "cid"
    t.string   "name"
    t.integer  "credits"
    t.string   "lecturer"
    t.string   "insemail"
    t.string   "area"
    t.text     "description"
    t.string   "ta"
    t.text     "notes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "application_pool_id"
    t.integer  "user_id"
  end

  create_table "student_applications", force: :cascade do |t|
    t.string   "uin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "advisor"
    t.integer  "degree"
    t.string   "start_semester"
    t.float    "gpa"
    t.integer  "position"
    t.string   "course_taken"
    t.string   "course_taed"
    t.string   "preferred_area"
    t.string   "preferred_course"
    t.integer  "status"
    t.integer  "active_term"
    t.integer  "course_assigned"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "application_pool_id"
    t.integer  "user_id"
    t.string   "requester"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "uin"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
