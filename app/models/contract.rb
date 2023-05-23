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
class Contract < ApplicationRecord
    has_many :elevators
end
