class AddStatusAndResolvedAtToQualityIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :quality_issues, :status, :integer, default: 0
    add_column :quality_issues, :resolved_at, :date
  end
end
