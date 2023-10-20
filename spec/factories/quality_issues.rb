FactoryBot.define do
  factory :quality_issue do
    contract { nil }
    date { "2023-10-18" }
    description { "MyText" }
    severity { 1 }
  end
end
