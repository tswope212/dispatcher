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

ActiveRecord::Schema.define(:version => 20121216231833) do

  create_table "addresses", :force => true do |t|
    t.integer   "street_number"
    t.integer   "street_id"
    t.timestamp "created_at",      :null => false
    t.timestamp "updated_at",      :null => false
    t.float     "latitude"
    t.float     "longitude"
    t.boolean   "gmaps"
    t.string    "zip_code"
    t.integer   "neighborhood_id"
  end

  add_index "addresses", ["street_id"], :name => "index_addresses_on_street_id"

  create_table "aptitudes", :force => true do |t|
    t.integer   "person_id"
    t.integer   "skill_id"
    t.integer   "level"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  add_index "aptitudes", ["person_id"], :name => "index_aptitudes_on_person_id"
  add_index "aptitudes", ["skill_id"], :name => "index_aptitudes_on_skill_id"

  create_table "assignments", :force => true do |t|
    t.integer   "operations_center_id"
    t.integer   "job_id"
    t.timestamp "created_at",           :null => false
    t.timestamp "updated_at",           :null => false
  end

  add_index "assignments", ["job_id"], :name => "index_assignments_on_job_id"
  add_index "assignments", ["operations_center_id"], :name => "index_assignments_on_operations_center_id"

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "deployments", :force => true do |t|
    t.integer   "city_id"
    t.integer   "team_id"
    t.timestamp "start_time"
    t.timestamp "end_time"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "deployments", ["city_id"], :name => "index_deployments_on_city_id"
  add_index "deployments", ["team_id"], :name => "index_deployments_on_team_id"

  create_table "dispatches", :force => true do |t|
    t.integer   "team_id"
    t.integer   "job_id"
    t.integer   "person_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "dispatches", ["job_id"], :name => "index_dispatches_on_job_id"
  add_index "dispatches", ["person_id"], :name => "index_dispatches_on_person_id"
  add_index "dispatches", ["team_id"], :name => "index_dispatches_on_team_id"

  create_table "jobs", :force => true do |t|
    t.integer   "task_id"
    t.integer   "unit_id"
    t.timestamp "scheduled_start"
    t.timestamp "scheduled_end"
    t.timestamp "actual_start"
    t.timestamp "actual_end"
    t.timestamp "created_at",      :null => false
    t.timestamp "updated_at",      :null => false
  end

  add_index "jobs", ["task_id"], :name => "index_jobs_on_task_id"
  add_index "jobs", ["unit_id"], :name => "index_jobs_on_unit_id"

  create_table "languages", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "neighborhoods", :force => true do |t|
    t.string    "name"
    t.integer   "city_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "neighborhoods", ["city_id"], :name => "index_neighborhoods_on_city_id"

  create_table "notes", :force => true do |t|
    t.text      "text"
    t.string    "image"
    t.integer   "job_id"
    t.integer   "category_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  add_index "notes", ["category_id"], :name => "index_notes_on_category_id"
  add_index "notes", ["job_id"], :name => "index_notes_on_job_id"

  create_table "operations_centers", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "unit_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  add_index "operations_centers", ["unit_id"], :name => "index_operations_centers_on_unit_id"

  create_table "people", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "primary_phone_number"
    t.date      "date_of_birth"
    t.boolean   "signed_waiver"
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "unconfirmed_email"
    t.string    "authentication_token"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
    t.string    "image"
  end

  add_index "people", ["authentication_token"], :name => "index_people_on_authentication_token", :unique => true
  add_index "people", ["confirmation_token"], :name => "index_people_on_confirmation_token", :unique => true
  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["reset_password_token"], :name => "index_people_on_reset_password_token", :unique => true

  create_table "phase_templates", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "proficiencies", :force => true do |t|
    t.integer   "language_id"
    t.string    "speaker_type"
    t.integer   "speaker_id"
    t.integer   "level"
    t.timestamp "created_at",   :null => false
    t.timestamp "updated_at",   :null => false
  end

  add_index "proficiencies", ["language_id"], :name => "index_proficiencies_on_language_id"

  create_table "residents", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "primary_phone_number"
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "unconfirmed_email"
    t.string    "authentication_token"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
    t.date      "date_of_birth"
    t.string    "image"
  end

  add_index "residents", ["authentication_token"], :name => "index_residents_on_authentication_token", :unique => true
  add_index "residents", ["confirmation_token"], :name => "index_residents_on_confirmation_token", :unique => true
  add_index "residents", ["email"], :name => "index_residents_on_email", :unique => true
  add_index "residents", ["reset_password_token"], :name => "index_residents_on_reset_password_token", :unique => true

  create_table "roles", :force => true do |t|
    t.integer   "person_id"
    t.integer   "team_id"
    t.integer   "skill_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "roles", ["person_id"], :name => "index_roles_on_person_id"
  add_index "roles", ["skill_id"], :name => "index_roles_on_skill_id"
  add_index "roles", ["team_id"], :name => "index_roles_on_team_id"

  create_table "signatures", :force => true do |t|
    t.integer   "waiver_id"
    t.string    "signatory_type"
    t.integer   "signatory_id"
    t.string    "content"
    t.timestamp "created_at",     :null => false
    t.timestamp "updated_at",     :null => false
  end

  add_index "signatures", ["waiver_id"], :name => "index_signatures_on_waiver_id"

  create_table "skills", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "steps", :force => true do |t|
    t.integer   "phase_template_id"
    t.integer   "task_id"
    t.integer   "position"
    t.timestamp "created_at",        :null => false
    t.timestamp "updated_at",        :null => false
  end

  add_index "steps", ["phase_template_id"], :name => "index_steps_on_phase_template_id"
  add_index "steps", ["task_id"], :name => "index_steps_on_task_id"

  create_table "streets", :force => true do |t|
    t.string    "name"
    t.integer   "city_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "streets", ["city_id"], :name => "index_streets_on_city_id"

  create_table "task_waivers", :force => true do |t|
    t.integer   "task_id"
    t.integer   "waiver_id"
    t.integer   "team_admin_id"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
  end

  add_index "task_waivers", ["task_id"], :name => "index_task_waivers_on_task_id"
  add_index "task_waivers", ["team_admin_id"], :name => "index_task_waivers_on_team_admin_id"
  add_index "task_waivers", ["waiver_id"], :name => "index_task_waivers_on_waiver_id"

  create_table "tasks", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "team_admins", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "phone_number"
    t.date      "date_of_birth"
    t.text      "personal_statement"
    t.boolean   "active"
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "unconfirmed_email"
    t.string    "authentication_token"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
    t.string    "image"
  end

  add_index "team_admins", ["authentication_token"], :name => "index_team_admins_on_authentication_token", :unique => true
  add_index "team_admins", ["confirmation_token"], :name => "index_team_admins_on_confirmation_token", :unique => true
  add_index "team_admins", ["email"], :name => "index_team_admins_on_email", :unique => true
  add_index "team_admins", ["reset_password_token"], :name => "index_team_admins_on_reset_password_token", :unique => true

  create_table "teams", :force => true do |t|
    t.string    "name"
    t.integer   "person_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.string    "image"
  end

  add_index "teams", ["person_id"], :name => "index_teams_on_person_id"

  create_table "units", :force => true do |t|
    t.string    "name"
    t.integer   "address_id"
    t.timestamp "created_at",               :null => false
    t.timestamp "updated_at",               :null => false
    t.integer   "resident_id"
    t.boolean   "needs_met"
    t.boolean   "power_on"
    t.boolean   "heater_needed"
    t.text      "medical_needs"
    t.text      "legal_needs"
    t.string    "fema_number"
    t.text      "insurance_situation"
    t.boolean   "rapid_response_contacted"
    t.boolean   "tenant_is_owner"
    t.boolean   "livable"
    t.text      "note"
    t.string    "image"
  end

  add_index "units", ["address_id"], :name => "index_units_on_address_id"

  create_table "waivers", :force => true do |t|
    t.string    "name"
    t.text      "text"
    t.string    "signature_type"
    t.timestamp "created_at",     :null => false
    t.timestamp "updated_at",     :null => false
  end

end
