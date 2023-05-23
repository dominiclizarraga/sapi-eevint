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
    WORK_STATUS_TYPES = %w(Preliminar Markups Final Buyout Others Customer)

    validates :work_status, presence: true

    validates :work_status, inclusion: { in: WORK_STATUS_TYPES }


    has_many :elevators
end
