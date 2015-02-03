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

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "descript"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learneds", force: true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learneds", ["user_id"], name: "index_learneds_on_user_id", using: :btree
  add_index "learneds", ["word_id"], name: "index_learneds_on_word_id", using: :btree

  create_table "lessons", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "result"
    t.integer  "numberOfQuestion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["category_id"], name: "index_lessons_on_category_id", using: :btree
  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "answer"
    t.boolean  "check"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["word_id"], name: "index_questions_on_word_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.integer  "word_id"
    t.integer  "question_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quizzes", ["lesson_id"], name: "index_quizzes_on_lesson_id", using: :btree
  add_index "quizzes", ["question_id"], name: "index_quizzes_on_question_id", using: :btree
  add_index "quizzes", ["word_id"], name: "index_quizzes_on_word_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "avatar"
    t.boolean  "admin"
    t.integer  "words"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "name"
    t.string   "mean"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id", using: :btree

end
