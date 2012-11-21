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

ActiveRecord::Schema.define(:version => 20121121165613) do

  create_table "addresses", :force => true do |t|
    t.integer  "street_number"
    t.integer  "street_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "addresses", ["street_id"], :name => "index_addresses_on_street_id"

  create_table "aptitudes", :force => true do |t|
    t.integer  "person_id"
    t.integer  "skill_id"
    t.integer  "level"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "aptitudes", ["person_id"], :name => "index_aptitudes_on_person_id"
  add_index "aptitudes", ["skill_id"], :name => "index_aptitudes_on_skill_id"

  create_table "assignments", :force => true do |t|
    t.integer  "operations_center_id"
    t.integer  "task_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "assignments", ["operations_center_id"], :name => "index_assignments_on_operations_center_id"
  add_index "assignments", ["task_id"], :name => "index_assignments_on_task_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dispatches", :force => true do |t|
    t.integer  "team_id"
    t.integer  "task_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dispatches", ["person_id"], :name => "index_dispatches_on_person_id"
  add_index "dispatches", ["task_id"], :name => "index_dispatches_on_task_id"
  add_index "dispatches", ["team_id"], :name => "index_dispatches_on_team_id"

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "neighborhoods", ["city_id"], :name => "index_neighborhoods_on_city_id"

  create_table "operations_centers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "unit_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "operations_centers", ["unit_id"], :name => "index_operations_centers_on_unit_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "primary_phone_number"
    t.date     "date_of_birth"
    t.boolean  "signed_waiver"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "people", ["authentication_token"], :name => "index_people_on_authentication_token", :unique => true
  add_index "people", ["confirmation_token"], :name => "index_people_on_confirmation_token", :unique => true
  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["reset_password_token"], :name => "index_people_on_reset_password_token", :unique => true

  create_table "roles", :force => true do |t|
    t.integer  "person_id"
    t.integer  "team_id"
    t.integer  "skill_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["person_id"], :name => "index_roles_on_person_id"
  add_index "roles", ["skill_id"], :name => "index_roles_on_skill_id"
  add_index "roles", ["team_id"], :name => "index_roles_on_team_id"

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "streets", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "streets", ["city_id"], :name => "index_streets_on_city_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "person_id"
    t.integer  "unit_id"
    t.datetime "scheduled_start"
    t.datetime "scheduled_end"
    t.datetime "actual_start"
    t.datetime "actual_end"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "tasks", ["person_id"], :name => "index_tasks_on_person_id"
  add_index "tasks", ["unit_id"], :name => "index_tasks_on_unit_id"

  create_table "team_admins", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.date     "date_of_birth"
    t.text     "personal_statement"
    t.boolean  "active"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "team_admins", ["authentication_token"], :name => "index_team_admins_on_authentication_token", :unique => true
  add_index "team_admins", ["confirmation_token"], :name => "index_team_admins_on_confirmation_token", :unique => true
  add_index "team_admins", ["email"], :name => "index_team_admins_on_email", :unique => true
  add_index "team_admins", ["reset_password_token"], :name => "index_team_admins_on_reset_password_token", :unique => true

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["person_id"], :name => "index_teams_on_person_id"

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "units", ["address_id"], :name => "index_units_on_address_id"

end
