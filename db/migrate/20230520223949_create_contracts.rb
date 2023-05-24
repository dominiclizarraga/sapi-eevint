class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :job_name, null: false
      t.string :job_number, null: false

      t.timestamps
    end
  end
end
