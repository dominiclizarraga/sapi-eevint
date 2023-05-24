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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_002554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.string "job_name", null: false
    t.string "job_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", force: :cascade do |t|
    t.string "customer_name"
    t.float "selling_price"
    t.string "elevator_type"
    t.text "description"
    t.string "subdivision"
    t.date "eng_required_estimate"
    t.date "eng_required_programming"
    t.date "actual_start"
    t.date "actual_end"
    t.bigint "contract_id", null: false
    t.bigint "work_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_elevators_on_contract_id"
    t.index ["work_status_id"], name: "index_elevators_on_work_status_id"
  end

  create_table "work_statuses", force: :cascade do |t|
    t.string "work_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "elevators", "contracts"
  add_foreign_key "elevators", "work_statuses"
end
