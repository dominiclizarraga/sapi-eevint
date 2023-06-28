class AddFieldsToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :entry_date, :date
    add_column :contracts, :weeks_estimate, :date
    add_column :contracts, :weeks_engineering, :date
  end
end
