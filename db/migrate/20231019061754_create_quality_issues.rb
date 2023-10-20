class CreateQualityIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :quality_issues do |t|
      t.references :contract, null: false, foreign_key: true
      t.date :date
      t.text :description
      t.integer :severity

      t.timestamps
    end
  end
end
