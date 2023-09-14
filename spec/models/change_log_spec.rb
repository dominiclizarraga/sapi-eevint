# == Schema Information
#
# Table name: change_logs
#
#  id              :bigint           not null, primary key
#  new_work_status :string
#  old_work_status :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contract_id     :bigint           not null
#
# Indexes
#
#  index_change_logs_on_contract_id  (contract_id)
#
# Foreign Keys
#
#  fk_rails_...  (contract_id => contracts.id)
#
require 'rails_helper'

RSpec.describe ChangeLog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
