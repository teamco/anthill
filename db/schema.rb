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

ActiveRecord::Schema.define(:version => 20120702120017) do

  create_table "domains", :force => true do |t|
    t.integer "item_id"
    t.string  "name"
    t.string  "ip"
  end

  add_index "domains", ["item_id"], :name => "index_domains_on_item_id"

  create_table "error_logs", :force => true do |t|
    t.integer  "user_log_id"
    t.string   "error_type"
    t.integer  "error_status"
    t.string   "error_title"
    t.text     "error_trace",  :limit => 16777215
    t.boolean  "is_fixed",                         :default => false
    t.integer  "fixed_by"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "item_connections", :force => true do |t|
    t.integer  "item_id",                            :null => false
    t.boolean  "up_connect",       :default => true, :null => false
    t.boolean  "up_list",          :default => true, :null => false
    t.boolean  "up_create",        :default => true, :null => false
    t.boolean  "up_read",          :default => true, :null => false
    t.boolean  "up_update",        :default => true, :null => false
    t.boolean  "up_delete",        :default => true, :null => false
    t.integer  "connectable_id"
    t.string   "connectable_type"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "item_connections", ["item_id"], :name => "index_item_connections_on_item_id"

  create_table "items", :force => true do |t|
    t.integer "reference_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.integer "language_id"
    t.integer "tool_id"
    t.integer "lock_id"
    t.integer "website_id"
    t.integer "created_by"
    t.integer "updated_by"
  end

  add_index "items", ["parent_id"], :name => "index_items_on_parent_id"
  add_index "items", ["reference_id"], :name => "index_items_on_reference_id"

  create_table "languages", :force => true do |t|
    t.integer "item_id"
    t.string  "lang_dialect"
    t.string  "short_name",   :limit => 2
    t.string  "alignment",    :limit => 20,  :default => "left"
    t.string  "direction",    :limit => 3,   :default => "ltr"
    t.string  "char_set",     :limit => 100, :default => "utf-8"
  end

  add_index "languages", ["item_id"], :name => "index_languages_on_item_id"

  create_table "preferences", :force => true do |t|
    t.integer  "item_id",                       :null => false
    t.boolean  "visible",    :default => true
    t.boolean  "active",     :default => true
    t.boolean  "published",  :default => true
    t.boolean  "public",     :default => true
    t.boolean  "commented",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "preferences", ["item_id"], :name => "index_preferences_on_item_id"

  create_table "profiles", :force => true do |t|
    t.integer "user_id"
    t.string  "email"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "nick_name"
  end

  create_table "shares", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.text    "meta_description"
    t.text    "meta_keywords"
    t.integer "shareable_id"
    t.string  "shareable_type"
  end

  create_table "tools", :force => true do |t|
    t.integer "item_id",   :null => false
    t.string  "tool_type"
  end

  add_index "tools", ["item_id"], :name => "index_tools_on_item_id"

  create_table "user_logs", :force => true do |t|
    t.integer  "user_id"
    t.string   "remote_ip"
    t.string   "session_id"
    t.integer  "status"
    t.integer  "location"
    t.string   "method"
    t.string   "controller"
    t.string   "action"
    t.string   "language",        :limit => 2
    t.integer  "item_id"
    t.string   "domain"
    t.string   "request_uri"
    t.string   "url"
    t.string   "protocol"
    t.string   "host"
    t.string   "port"
    t.text     "user_params",     :limit => 16777215
    t.text     "user_session"
    t.text     "user_cookies"
    t.string   "query_string"
    t.string   "http_accept"
    t.string   "format"
    t.boolean  "ssl"
    t.boolean  "xhr"
    t.string   "referer"
    t.string   "http_user_agent"
    t.string   "server_software"
    t.string   "content_type"
    t.string   "charset"
    t.float    "completed_in"
    t.boolean  "is_error",                            :default => true
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  create_table "users", :force => true do |t|
    t.integer "item_id",       :null => false
    t.integer "language_id"
    t.string  "login"
    t.string  "password_hash", :null => false
    t.string  "password_salt", :null => false
    t.integer "timeout"
  end

  add_index "users", ["item_id"], :name => "index_users_on_item_id"

end
