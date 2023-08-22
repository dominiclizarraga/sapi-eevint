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

  describe 'validations' do
    it 'is valid with all required attributes' do
      contract = FactoryBot.build(:contract)
      elevator = create(:elevator)
      expect(elevator.valid?).to be_truthy
    end

    it 'is invalid without a Contract' do
      elevator = Elevator.new(
        description: 'Sample Description',
        elevator_type: "T2",
        subdivision: 'Sample Subdivision',
        contract_id: nil
      )
      expect(elevator.valid?).to be_falsey
      expect(elevator.errors[:contract]).to include("must exist")
    end
  end
end
