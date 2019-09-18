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

ActiveRecord::Schema.define(version: 2019_09_18_160932) do

  create_table "action_checklists", force: :cascade do |t|
    t.integer "action_id"
    t.integer "checklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_action_checklists_on_action_id"
    t.index ["checklist_id"], name: "index_action_checklists_on_checklist_id"
  end

  create_table "action_tags", force: :cascade do |t|
    t.integer "action_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_action_tags_on_action_id"
    t.index ["tag_id"], name: "index_action_tags_on_tag_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.string "description"
    t.datetime "due"
    t.integer "importance"
    t.integer "desirability"
    t.string "supplies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "environment_id"
    t.integer "user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditionals", force: :cascade do |t|
    t.string "chore_id"
    t.string "gratification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
