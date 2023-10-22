# == Schema Information
#
# Table name: quality_issues
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :text
#  resolved_at :date
#  severity    :integer
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  contract_id :bigint           not null
#
# Indexes
#
#  index_quality_issues_on_contract_id  (contract_id)
#
# Foreign Keys
#
#  fk_rails_...  (contract_id => contracts.id)
#
class QualityIssue < ApplicationRecord
  belongs_to :contract
  
  validates :date, presence: true
  validates :description, presence: true
  validates :severity, presence: true
  validates :status, presence: true
  validates :contract_id, presence: true

  
  enum severity: { low: 0, medium: 1, high: 2, critical: 3 }

  enum status: { open: 0, pending: 1, resolved: 2 }

end

