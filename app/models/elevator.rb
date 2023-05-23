class Elevator < ApplicationRecord
  belongs_to :contract
  belongs_to :work_status
end
