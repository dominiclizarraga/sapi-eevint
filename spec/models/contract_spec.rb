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

  def build_contract(attributes = {})
    Contract.new(
      job_name: 'Sample Job',
      job_number: '12345',
      created_at: Time.now,
      updated_at: Time.now,
      actual_end_at: Time.now,
      actual_start_at: Time.now,
      customer_name: 'John Doe',
      eng_required_date_at: Time.now,
      selling_price: 1000,
      work_status: 1,
      entry_date: Date.today,
      weeks_estimate: 4,
      weeks_engineering: 2,
      **attributes
    )
  end

  describe 'validations' do
    it 'with all valid attributes' do
      contract = build_contract
      expect(contract.valid?).to be_truthy
    end

    it 'contract with invalid job_number' do
      contract = Contract.new(job_number: nil)
      expect(contract.valid?).to be_falsey
      expect(contract.errors[:job_number]).to include("can't be blank")
    end
  end

end
