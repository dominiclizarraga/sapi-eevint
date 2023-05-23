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
require 'rails_helper'

RSpec.describe Contract, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
