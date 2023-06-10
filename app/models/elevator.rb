# == Schema Information
#
# Table name: elevators
#
#  id                       :bigint           not null, primary key
#  actual_end               :date
#  actual_start             :date
#  customer_name            :string
#  description              :text
#  elevator_type            :integer
#  eng_required_estimate    :date
#  eng_required_programming :date
#  selling_price            :float
#  subdivision              :string
#  work_status              :integer
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
            :eng_required_programming, :work_status, presence: true

  enum work_status: {
    Preliminar: 0,
    Markups: 1,
    Final: 2,
    Buyout: 3,
    Others: 4,
    Customer: 5,
    Waiting: 6
  }

  enum elevator_type: {
    T1: 0,
    T2: 1,
    T3: 2,
    T4: 3,
    T5: 4
  }

  belongs_to :contract
  # look up the work_status_id use de enum values
end
