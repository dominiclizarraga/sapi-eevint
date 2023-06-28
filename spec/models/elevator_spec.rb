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
require 'rails_helper'

RSpec.describe Elevator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
