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

ActiveRecord::Schema[7.0].define(version: 2023_06_30_031740) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "elevators", "contracts"
end
