# == Schema Information
#
# Table name: work_statuses
#
#  id          :bigint           not null, primary key
#  work_status :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe WorkStatus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
