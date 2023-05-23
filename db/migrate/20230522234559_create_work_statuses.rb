class CreateWorkStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :work_statuses do |t|
      t.string :work_status

      t.timestamps
    end
  end
end
