# == Schema Information
#
# Table name: elevators
#
#  id            :bigint           not null, primary key
#  description   :text
#  elevator_type :integer
#  subdivision   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contract_id   :bigint           not null
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
  validates :description, 
            :subdivision, :elevator_type, presence: true
 
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
