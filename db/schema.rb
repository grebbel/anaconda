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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120809133638) do

  create_table "amplifications", :force => true do |t|
    t.integer  "analysis_id"
    t.integer  "cycle",       :null => false
    t.float    "rn",          :null => false
    t.float    "delta_rn",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "analyses", :force => true do |t|
    t.integer  "request_id",                    :null => false
    t.integer  "target_id"
    t.integer  "assay_id"
    t.float    "ct"
    t.float    "treshold"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.boolean  "secondary",  :default => false
  end

  add_index "analyses", ["target_id", "request_id", "assay_id"], :name => "index_analyses_on_target_id_and_request_id_and_assay_id", :unique => true

  create_table "assay_targets", :force => true do |t|
    t.integer  "assay_id",   :null => false
    t.integer  "target_id",  :null => false
    t.float    "treshold",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assay_targets", ["assay_id", "target_id"], :name => "index_assay_targets_on_assay_id_and_target_id", :unique => true

  create_table "assays", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assays", ["name"], :name => "index_assays_on_name", :unique => true

  create_table "colors", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "hex",        :null => false
    t.integer  "red",        :null => false
    t.integer  "green",      :null => false
    t.integer  "blue",       :null => false
    t.float    "luminance",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.string   "identifier",  :limit => 50,  :null => false
    t.string   "description", :limit => 100, :null => false
    t.datetime "due_date",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       :limit => 50
  end

  create_table "tags", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "category",    :limit => 50
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "target_codes", :force => true do |t|
    t.integer  "target_id",                :null => false
    t.string   "code",       :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_codes", ["code"], :name => "index_target_codes_on_code", :unique => true

  create_table "target_tags", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "target_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_tags", ["tag_id", "target_id"], :name => "index_target_tags_on_tag_id_and_target_id", :unique => true

  create_table "target_types", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_id"
    t.integer  "color_id"
  end

  add_index "targets", ["name"], :name => "index_targets_on_name", :unique => true

  create_table "tasks", :force => true do |t|
    t.string   "description",                    :null => false
    t.boolean  "completed",   :default => false, :null => false
    t.integer  "assignee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "request_id",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password",                :default => "", :null => false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",          :limit => 50
    t.string   "prefix",              :limit => 30
    t.string   "last_name",           :limit => 50
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
