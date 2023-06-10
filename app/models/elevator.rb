# == Schema Information
#
# Table name: elevators
#
#  id                       :bigint           not null, primary key
#  actual_end               :date
#  actual_start             :date
#  customer_name            :string
#  description              :text
#  elevator_type            :string
#  eng_required_estimate    :date
#  eng_required_programming :date
#  selling_price            :float
#  subdivision              :string
#  work_status              :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  contract_id              :bigint           not null
#
# Indexes
#
#  index_elevators_on_contract_id  (contract_id)
#
# Foreign Keys
#
#  fk_rails_...  (contract_id => contracts.id)
#
class Elevator < ApplicationRecord
  validates :customer_name, :description, 
            :subdivision, :elevator_type, :selling_price,  
            :actual_start, :actual_end, :eng_required_estimate, 
            :eng_required_programming, presence: true

  belongs_to :contract
  belongs_to :work_status

  accepts_nested_attributes_for :work_status

  # look up the work_status_id use de enum values
end
