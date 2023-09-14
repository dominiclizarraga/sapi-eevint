class CreateChangeLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :change_logs do |t|
      t.references :contract, null: false, foreign_key: true
      t.string :old_work_status
      t.string :new_work_status

      t.timestamps
    end
  end
end
