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

ActiveRecord::Schema.define(version: 20171015181846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_attachments", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "attachment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "application_company_relationships", id: false, force: :cascade do |t|
    t.integer "application_id"
    t.integer "company_id"
  end

  create_table "application_notes", force: :cascade do |t|
    t.integer  "application_id"
    t.integer  "note_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "applications", force: :cascade do |t|
    t.string   "position"
    t.string   "company_name"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status_id",    default: 1
    t.string   "document"
    t.string   "posting_url"
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "industry"
    t.text     "website"
    t.decimal  "overall_rating"
    t.string   "square_logo"
    t.string   "ceo_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.string   "to"
    t.string   "from"
    t.date     "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "application_id"
  end

  create_table "notes", force: :cascade do |t|
    t.date     "date"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
