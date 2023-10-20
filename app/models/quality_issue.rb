class QualityIssue < ApplicationRecord
  belongs_to :contract

  enum severity: { low: 0, medium: 1, high: 2, critical: 3 }

  # before_save :set_contract_attributes

  # def set_contract_attributes
  #   self.job_number = contract.job_number
  #   self.customer_name = contract.customer_name
  # end

end
