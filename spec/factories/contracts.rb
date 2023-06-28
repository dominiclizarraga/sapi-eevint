# == Schema Information
#
# Table name: contracts
#
#  id                       :bigint           not null, primary key
#  actual_end               :date
#  actual_start             :date
#  customer_name            :string
#  eng_required_programming :date
#  entry_date               :date
#  job_name                 :string           not null
#  job_number               :string           not null
#  selling_price            :float
#  weeks_engineering        :date
#  weeks_estimate           :date
#  work_status              :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
FactoryBot.define do
  factory :contract do
    job_name { "MyString" }
    job_number { 1 }
    contract_type { "MyString" }
  end
end
