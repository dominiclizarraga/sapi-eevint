class RenameDateFieldsColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :contracts, :actual_end, :actual_end_at
    rename_column :contracts, :actual_start, :actual_start_at
    rename_column :contracts, :eng_required_programming, :eng_required_date_at
  end
end
