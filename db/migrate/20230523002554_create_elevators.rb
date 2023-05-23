class CreateElevators < ActiveRecord::Migration[7.0]
  def change
    create_table :elevators do |t|
      t.string :customer_name
      t.float :selling_price
      t.string :elevator_type
      t.text :description
      t.string :subdivision
      t.date :eng_required_estimate
      t.date :eng_required_programming
      t.date :actual_start
      t.date :actual_end
      t.references :contract, null: false, foreign_key: true
      t.references :work_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
