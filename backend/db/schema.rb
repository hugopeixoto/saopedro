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

ActiveRecord::Schema.define(version: 20150627114006) do

  create_table "machine_templates", force: :cascade do |t|
    t.string   "name"
    t.integer  "disk"
    t.integer  "cores"
    t.integer  "ram"
    t.string   "price"
    t.string   "location"
    t.string   "transfer"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "machine_templates", ["name", "provider_id"], name: "index_machine_templates_on_name_and_provider_id", unique: true

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "disk_usage"
    t.integer  "machine_template_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "machines", ["name"], name: "index_machines_on_name", unique: true

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "providers", ["name"], name: "index_providers_on_name", unique: true

  create_table "runscripts", force: :cascade do |t|
    t.string   "name"
    t.text     "script"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "runscripts", ["name"], name: "index_runscripts_on_name", unique: true

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

end
