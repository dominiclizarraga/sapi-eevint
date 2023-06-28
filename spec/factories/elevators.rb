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
FactoryBot.define do
  factory :elevator do
    customer_name { "MyString" }
    selling_price { 1.5 }
    type { "" }
    description { "MyText" }
    subdivision { "MyString" }
    eng_required_estimate { "2023-05-22" }
    eng_required_programming { "2023-05-22" }
    actual_start { "2023-05-22" }
    actual_end { "2023-05-22" }
    contract { nil }
    work_status { nil }
  end
end
