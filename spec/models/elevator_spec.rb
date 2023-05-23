# == Schema Information
#
# Table name: elevators
#
#  id                       :bigint           not null, primary key
#  actual_end               :date
#  actual_start             :date
#  customer_name            :string
#  description              :text
#  eng_required_estimate    :date
#  eng_required_programming :date
#  selling_price            :float
#  subdivision              :string
#  type                     :string
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
require 'rails_helper'

RSpec.describe Elevator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
