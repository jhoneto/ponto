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

ActiveRecord::Schema.define(:version => 20120703125653) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enterprise_id"
    t.integer  "employee_id"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "fingerprint",          :limit => 2000
    t.string   "cpf",                  :limit => 20
    t.string   "sex",                  :limit => 1
    t.string   "registry"
    t.string   "password"
    t.integer  "enterprise_id"
    t.date     "date_of_birth"
    t.string   "address",              :limit => 100
    t.string   "address_number",       :limit => 10
    t.string   "address_complement",   :limit => 30
    t.string   "address_zip_code",     :limit => 9
    t.string   "address_neighborhood", :limit => 60
    t.string   "address_city",         :limit => 60
    t.string   "adress_state",         :limit => 2
    t.string   "email"
    t.string   "phone",                :limit => 20
    t.string   "cel_phone",            :limit => 20
    t.string   "rg_number",            :limit => 40
    t.string   "rg_issuing",           :limit => 20
    t.date     "rg_issue_date"
    t.string   "ctps_number",          :limit => 40
    t.string   "cpts_series",          :limit => 20
    t.string   "cpts_uf",              :limit => 2
    t.string   "nit_pis_pasep",        :limit => 60
    t.date     "date_of_admission"
    t.integer  "office_hour_id"
    t.integer  "role_id"
    t.integer  "department_id"
    t.integer  "status"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enterprises", :force => true do |t|
    t.string   "name"
    t.string   "corporate_name"
    t.string   "cnpj",                 :limit => 20
    t.string   "address",              :limit => 100
    t.string   "address_number",       :limit => 10
    t.string   "address_complement",   :limit => 30
    t.string   "address_zip_code",     :limit => 9
    t.string   "address_neighborhood", :limit => 60
    t.string   "address_city",         :limit => 60
    t.string   "adress_state",         :limit => 2
    t.string   "email"
    t.string   "phone",                :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holidays", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enterprise_id"
  end

  create_table "justifications", :force => true do |t|
    t.integer  "employee_id"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "office_hour_items", :force => true do |t|
    t.integer  "day"
    t.time     "entry_1"
    t.time     "exit_1"
    t.time     "entry_2"
    t.time     "exit_2"
    t.time     "entry_3"
    t.time     "exit_3"
    t.integer  "office_hour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "office_hours", :force => true do |t|
    t.string   "name"
    t.boolean  "is_free"
    t.integer  "input_tolerance"
    t.integer  "output_tolerance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enterprise_id"
  end

  create_table "points", :force => true do |t|
    t.integer  "employee_id"
    t.datetime "date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "action"
  end

  create_table "records", :force => true do |t|
    t.integer  "employee_id"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
