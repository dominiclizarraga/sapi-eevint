# == Schema Information
#
# Table name: work_statuses
#
#  id          :bigint           not null, primary key
#  work_status :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :work_status do
    work_status { "MyString" }
  end
end
