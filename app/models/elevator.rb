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
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  contract_id              :bigint           not null
#  work_status_id           :bigint           not null
#
# Indexes
#
#  index_elevators_on_contract_id     (contract_id)
#  index_elevators_on_work_status_id  (work_status_id)
#
# Foreign Keys
#
#  fk_rails_...  (contract_id => contracts.id)
#  fk_rails_...  (work_status_id => work_statuses.id)
#
class Elevator < ApplicationRecord
  validates :customer_name, :description, 
            :subdivision, :elevator_type, :selling_price,  
            :actual_start, :actual_end, :eng_required_estimate, 
            :eng_required_programming, presence: true

  belongs_to :contract
  belongs_to :work_status
end
