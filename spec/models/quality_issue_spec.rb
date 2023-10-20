# == Schema Information
#
# Table name: quality_issues
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :text
#  severity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  contract_id :bigint           not null
#
# Indexes
#
#  index_quality_issues_on_contract_id  (contract_id)
#
# Foreign Keys
#
#  fk_rails_...  (contract_id => contracts.id)
#
require 'rails_helper'

RSpec.describe QualityIssue, type: :model do
  describe 'associations' do
    it 'belongs to a contract' do
      contract = FactoryBot.create(:contract)
      quality_issue = FactoryBot.create(:quality_issue, contract: contract)
      expect(quality_issue.contract).to eq(contract)
    end
  end

  describe 'validations' do
    it 'validates presence of date' do
      quality_issue = QualityIssue.new(date: nil)
      expect(quality_issue.valid?).to be_falsey
      expect(quality_issue.errors[:date]).to include("can't be blank")
    end

    it 'validates presence of description' do
      quality_issue = QualityIssue.new(description: nil)
      expect(quality_issue.valid?).to be_falsey
      expect(quality_issue.errors[:description]).to include("can't be blank")
    end

    it 'validates presence of severity' do
      quality_issue = QualityIssue.new(severity: nil)
      expect(quality_issue.valid?).to be_falsey
      expect(quality_issue.errors[:severity]).to include("can't be blank")
    end
  end

end

