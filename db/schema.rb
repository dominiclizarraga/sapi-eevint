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

ActiveRecord::Schema[7.0].define(version: 2023_11_01_015025) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "change_logs", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.string "old_work_status"
    t.string "new_work_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_change_logs_on_contract_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "job_name", null: false
    t.string "job_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "actual_end_at"
    t.date "actual_start_at"
    t.string "customer_name"
    t.date "eng_required_date_at"
    t.float "selling_price"
    t.integer "work_status"
    t.date "entry_date"
    t.date "weeks_estimate"
    t.date "weeks_engineering"
    t.index ["job_number"], name: "index_contracts_on_job_number", unique: true
  end

  create_table "elevators", force: :cascade do |t|
    t.integer "elevator_type"
    t.text "description"
    t.string "subdivision"
    t.bigint "contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_elevators_on_contract_id"
  end

  create_table "quality_issues", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.date "date"
    t.text "description"
    t.integer "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.date "resolved_at"
    t.index ["contract_id"], name: "index_quality_issues_on_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "change_logs", "contracts"
  add_foreign_key "elevators", "contracts"
  add_foreign_key "quality_issues", "contracts"
end
