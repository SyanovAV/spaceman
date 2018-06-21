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

ActiveRecord::Schema.define(version: 20180609103156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_data_on_request_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "folder_id"
    t.string "name"
    t.string "description"
    t.string "order"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_folders_on_collection_id"
  end

  create_table "headers", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.string "value"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "request_id"
    t.string "raw_headers"
    t.string "description"
    t.string "method"
    t.string "url"
    t.string "data_mode"
    t.string "tests"
    t.string "name"
    t.string "raw_mode_data"
    t.string "path_variables"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "folder_id"
    t.index ["collection_id"], name: "index_requests_on_collection_id"
    t.index ["folder_id"], name: "index_requests_on_folder_id"
  end

  create_table "response_codes", force: :cascade do |t|
    t.integer "code"
    t.bigint "response_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_response_codes_on_response_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "responce_id"
    t.string "name"
    t.string "status"
    t.string "value"
    t.string "text"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_responses_on_request_id"
  end

  add_foreign_key "requests", "folders"
end
