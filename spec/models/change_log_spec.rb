# == Schema Information
#
# Table name: change_logs
#
#  id              :bigint           not null, primary key
#  new_work_status :string
#  old_work_status :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contract_id     :bigint           not null
#
# Indexes
#
#  index_change_logs_on_contract_id  (contract_id)
#
# Foreign Keys
#
#  fk_rails_...  (contract_id => contracts.id)
#
require 'rails_helper'

RSpec.describe ChangeLog, type: :model do

  describe 'associations' do
    it 'belongs to a contract' do
      association = ChangeLog.reflect_on_association(:contract)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    let(:change_log) { build(:change_log) }

    it 'is valid with valid attributes' do
      expect(change_log.valid?).to be_truthy
    end

    it 'is invalid without a contract' do
      change_log.contract = nil
      expect(change_log.valid?).to be_falsey
      expect(change_log.errors[:contract]).to include("must exist")
    end

    it 'is valid without old_work_status' do
      change_log.old_work_status = nil
      expect(change_log.valid?).to be_truthy
    end

    it 'is valid without new_work_status' do
      change_log.new_work_status = nil
      expect(change_log.valid?).to be_truthy
    end
  end

  describe 'attributes' do
    let(:change_log) { create(:change_log, old_work_status: "OldStatus", new_work_status: "NewStatus") }

    it 'has an old_work_status attribute' do
      expect(change_log.old_work_status).to eq("OldStatus")
    end

    it 'has a new_work_status attribute' do
      expect(change_log.new_work_status).to eq("NewStatus")
    end
  end
end

