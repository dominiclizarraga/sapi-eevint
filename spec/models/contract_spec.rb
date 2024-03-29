# == Schema Information
#
# Table name: contracts
#
#  id                   :bigint           not null, primary key
#  actual_end_at        :date
#  actual_start_at      :date
#  customer_name        :string
#  eng_required_date_at :date
#  entry_date           :date
#  job_name             :string           not null
#  job_number           :string           not null
#  selling_price        :float
#  weeks_engineering    :date
#  weeks_estimate       :date
#  work_status          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_contracts_on_job_number  (job_number) UNIQUE
#
require 'rails_helper'

RSpec.describe Contract, type: :model do

  describe 'creation' do
    it 'should have 1 contract created after creation' do
      contract = FactoryBot.create(:contract)

      expect(Contract.count).to eq(1)
    end
  end

  describe 'validations' do
    it 'with all valid attributes' do
      contract = create(:contract)
      expect(contract.valid?).to be_truthy
    end

    it 'with invalid job_number' do
      contract = Contract.new(job_number: nil)
      expect(contract.valid?).to be_falsey
      expect(contract.errors[:job_number]).to include("can't be blank")
    end
  end

  describe 'Associations' do
    let(:contract) { FactoryBot.create(:contract) }
    let!(:elevator_1) { FactoryBot.create(:elevator, contract: contract) }
    let!(:elevator_2) { FactoryBot.create(:elevator, contract: contract) }

    it 'should have many elevators' do
      expect(contract.elevators).to include(elevator_1, elevator_2)
    end
  end

  describe 'Nested Attributes' do
    it 'allows for nested attributes for elevators' do
      contract = FactoryBot.create(:contract)
      elevator = FactoryBot.create(:elevator, contract: contract)
      contract.reload

      expect(contract.elevators).to include(elevator)
    end
  end
end
