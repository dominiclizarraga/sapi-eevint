class AddUniqueToContracts < ActiveRecord::Migration[7.0]
  def change
    add_index :contracts, :job_number, unique: true
  end
end
