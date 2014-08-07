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

ActiveRecord::Schema.define(:version => 20140807092156) do

  create_table "customers", :force => true do |t|
    t.integer  "permission_id"
    t.string   "name",                   :limit => 45
    t.string   "mobile",                 :limit => 45
    t.text     "address"
    t.binary   "is_member"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "customers", ["confirmation_token"], :name => "index_customers_on_confirmation_token", :unique => true
  add_index "customers", ["email"], :name => "index_customers_on_email", :unique => true
  add_index "customers", ["reset_password_token"], :name => "index_customers_on_reset_password_token", :unique => true

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "mobile"
    t.text     "address"
    t.integer  "permission_id"
    t.boolean  "enabled"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.integer  "quantity"
    t.integer  "status"
    t.text     "delivery_name"
    t.text     "delivery_address"
    t.integer  "delivery_method"
    t.integer  "payment"
    t.boolean  "enabled"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "delivery_mobile"
    t.integer  "sum_price"
  end

  create_table "permissions", :force => true do |t|
    t.string   "type"
    t.integer  "power"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_images", :force => true do |t|
    t.string   "name"
    t.text     "url"
    t.boolean  "enabled"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "product_id"
    t.string   "title"
    t.text     "description"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "intro"
    t.text     "desc"
    t.integer  "price"
    t.integer  "discount"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_top"
  end

end
