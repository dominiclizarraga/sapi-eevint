# == Schema Information
#
# Table name: contracts
#
#  id                   :bigint           not null, primary key
#  actual_end_at        :date
#  actual_start_at      :date
#  customer_name        :string
#  eng_required_date_at :date
#  entry_date           :date
#  job_name             :string           not null
#  job_number           :string           not null
#  selling_price        :float
#  weeks_engineering    :date
#  weeks_estimate       :date
#  work_status          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_contracts_on_job_number  (job_number) UNIQUE
#
class Contract < ApplicationRecord
    validates :job_name, :job_number, :actual_end_at, :actual_start_at, 
              :customer_name, :eng_required_date_at, :entry_date, 
              :selling_price, :weeks_engineering, :weeks_estimate,
              :work_status,  presence: true

    validates :job_number, uniqueness: true

    has_many :elevators, dependent: :destroy

    has_many :change_logs


    enum work_status: {
        preliminar: 0,
        markups: 1,
        final: 2,
        buyout: 3,
        others: 4,
        customer: 5,
        waiting: 6
      }

    accepts_nested_attributes_for :elevators
    
    after_save :log_work_status_change, if: :saved_change_to_work_status?


    def self.search(params)
      base_query = self.includes(:elevators)
      
      return base_query if params[:query].blank?
    
      search_term = "%#{sanitize_sql_like(params[:query])}%"
      work_status_value = Contract.work_statuses[params[:query]]
    
      if work_status_value
        base_query.where(work_status: work_status_value)
      else
        base_query.where("job_number LIKE :search OR customer_name LIKE :search OR job_name LIKE :search", 
                         search: search_term)
      end
    end
    
    def self.contracts_count_by_status
      group(:work_status).count
    end

    def all_elevator_types
      if elevators.any?
        elevators.map(&:elevator_type).join(', ')
      else
        'No elevator type'
      end
    end

    def all_descriptions
      if elevators.size > 0
        elevators.map(&:description).join(', ')
      else
        'No description provided'
      end
    end

    private

    def log_work_status_change
      # where is the contract_id?
      change_logs.create(old_work_status: work_status_before_last_save, new_work_status: work_status)
    end

end
