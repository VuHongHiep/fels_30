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

ActiveRecord::Schema.define(version: 20150203072137) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "action",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "descript",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learneds", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "word_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learneds", ["user_id"], name: "index_learneds_on_user_id", using: :btree
  add_index "learneds", ["word_id"], name: "index_learneds_on_word_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "category_id",      limit: 4
    t.integer  "result",           limit: 4
    t.integer  "numberOfQuestion", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["category_id"], name: "index_lessons_on_category_id", using: :btree
  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "answer",     limit: 255
    t.boolean  "check",      limit: 1
    t.integer  "word_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["word_id"], name: "index_questions_on_word_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.integer  "word_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "lesson_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quizzes", ["lesson_id"], name: "index_quizzes_on_lesson_id", using: :btree
  add_index "quizzes", ["question_id"], name: "index_quizzes_on_question_id", using: :btree
  add_index "quizzes", ["word_id"], name: "index_quizzes_on_word_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "avatar",          limit: 255
    t.boolean  "admin",           limit: 1
    t.integer  "words",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "mean",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id", using: :btree

end
