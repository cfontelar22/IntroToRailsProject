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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_171902) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genre"
    t.integer "publication_year"
    t.integer "library_branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_branch_id"], name: "index_books_on_library_branch_id"
  end

  create_table "borrowings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.date "due_date"
    t.date "returned_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrowings_on_book_id"
    t.index ["user_id"], name: "index_borrowings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_branches", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string "location"
    t.float "temperature"
    t.integer "humidity"
    t.string "precipitation"
    t.float "wind_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "library_branches"
  add_foreign_key "borrowings", "books"
  add_foreign_key "borrowings", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
