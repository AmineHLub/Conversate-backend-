# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_27_132827) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.text "password"
    t.text "text"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "direct_comments", force: :cascade do |t|
    t.text "text"
    t.text "username"
    t.bigint "user_id", null: false
    t.bigint "conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_direct_comments_on_conversation_id"
    t.index ["user_id"], name: "index_direct_comments_on_user_id"
  end

  create_table "nested_comments", force: :cascade do |t|
    t.text "text"
    t.text "username"
    t.bigint "user_id", null: false
    t.bigint "direct_comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direct_comment_id"], name: "index_nested_comments_on_direct_comment_id"
    t.index ["user_id"], name: "index_nested_comments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "img", default: "hey", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conversations", "users"
  add_foreign_key "direct_comments", "conversations"
  add_foreign_key "direct_comments", "users"
  add_foreign_key "nested_comments", "direct_comments"
  add_foreign_key "nested_comments", "users"
end
