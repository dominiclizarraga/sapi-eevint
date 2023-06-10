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
require 'rails_helper'

RSpec.describe Elevator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
