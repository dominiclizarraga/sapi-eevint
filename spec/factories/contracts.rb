# == Schema Information
#
# Table name: contracts
#
#  id            :bigint           not null, primary key
#  contract_type :string           not null
#  job_name      :string           not null
#  job_number    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :contract do
    job_name { "MyString" }
    job_number { 1 }
    contract_type { "MyString" }
  end
end
