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

ActiveRecord::Schema.define(:version => 20101104231514) do

  create_table "active_polls", :force => true do |t|
    t.integer "poll_id"
    t.integer "question_id"
  end
  create_table "answers", :force => true do |t|
    t.string   "body"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "correct",     :default => false
  end

  create_table "polls", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls_questions", :id => false, :force => true do |t|
    t.integer "poll_id"
    t.integer "question_id"
    t.integer "weight",      :default => 0
  end

  create_table "questions", :force => true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.integer  "agr_num_questions"
    t.integer  "agr_num_participants"
    t.float    "agr_avg_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poll_id"
  end

end
