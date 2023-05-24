# == Schema Information
#
# Table name: contracts
#
#  id         :bigint           not null, primary key
#  job_name   :string           not null
#  job_number :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contract < ApplicationRecord
    validates :job_name, :job_number, presence: true
    validates :job_number, uniqueness: true

    has_many :elevators
end
