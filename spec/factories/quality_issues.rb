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
FactoryBot.define do
  factory :quality_issue do
    contract { association(:contract) }
    date { Faker::Date.between(from: 2.years.ago, to: Date.today) }
    description { Faker::Lorem.paragraph }
    severity { QualityIssue.severities.keys.sample }
  end
end

