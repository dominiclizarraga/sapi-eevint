# == Schema Information
#
# Table name: work_statuses
#
#  id          :bigint           not null, primary key
#  work_status :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class WorkStatus < ApplicationRecord
    has_many :elevators
end
