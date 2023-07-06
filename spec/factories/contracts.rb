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
FactoryBot.define do
  factory :contract do
    job_name { "Sample Job" }
    job_number { '12345' }
    actual_end_at { Time.now }
    actual_start_at { Time.now }
    customer_name { 'John Doe'}
    eng_required_date_at { Time.now }
    selling_price { 1000 }
    work_status { 'preliminar' }
    entry_date { Date.today }
    weeks_estimate { Time.now + 4 }
    weeks_engineering { Time.now + 2 }
  end
end
