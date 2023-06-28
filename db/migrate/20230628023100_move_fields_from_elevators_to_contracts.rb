class MoveFieldsFromElevatorsToContracts < ActiveRecord::Migration[7.0]
  def change
    remove_column :elevators, :actual_end
    remove_column :elevators, :actual_start
    remove_column :elevators, :customer_name
    # This column is no longer needed eng_required_estimate
    remove_column :elevators, :eng_required_estimate
    remove_column :elevators, :eng_required_programming
    remove_column :elevators, :selling_price
    remove_column :elevators, :work_status

    add_column :contracts, :actual_end, :date
    add_column :contracts, :actual_start, :date
    add_column :contracts, :customer_name, :string
    add_column :contracts, :eng_required_programming, :date
    add_column :contracts, :selling_price, :float
    add_column :contracts, :work_status, :integer
  end
end
