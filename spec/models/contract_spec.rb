# == Schema Information
#
# Table name: contracts
#
#  id                       :bigint           not null, primary key
#  actual_end               :date
#  actual_start             :date
#  customer_name            :string
#  eng_required_programming :date
#  entry_date               :date
#  job_name                 :string           not null
#  job_number               :string           not null
#  selling_price            :float
#  weeks_engineering        :date
#  weeks_estimate           :date
#  work_status              :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'rails_helper'

RSpec.describe Contract, type: :model do
  # it { should validate_presence_of(:job_name) }
end
