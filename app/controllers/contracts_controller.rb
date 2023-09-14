class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]

  def home
  end

  # GET /contracts or /contracts.json
  def index
    # add index to speed up search
    # Postgres db has a search feature
    # explore gems for search like algolia or https://www.meilisearch.com/
    # check if the lenght arrays is zero don't show headers
    if params[:query].present?
      @contracts = Contract.includes(:elevators).search(params)
    elsif params[:work_status].present?
      @contracts = Contract.includes(:elevators).where(work_status: params[:work_status])
    else
      @contracts = Contract.includes(:elevators).all
    end
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
    @contract.elevators.build
    # @contract.elevators.work_status = WorkStatus.new
    # debugger
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to contract_url(@contract), notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url, notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def work_statuses 
    # where do i get the Contract data?
    # scope is another option or helper method
    contract_statuses_stats
  end

  def planning
    contract_statuses_stats
  
    @statuses = %w[preliminar markups final buyout others customer waiting]
    @contracts_by_status = {}
    @all_contracts = Contract.includes(:elevators).all.to_a
    @contracts = @all_contracts
  
    @statuses.each do |status|
      @contracts_by_status[status] = @all_contracts.select { |contract| contract.work_status == status }
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Report planning, date: #{Time.now.strftime("%d/%m/%Y")}", template: "contracts/planning_pdf", formats: [:html], 
        orientation: 'Landscape'
      end
    end
  end

  def history
    @contracts = Contract.all
    @change_logs = ChangeLog.order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_params
      params.require(:contract).permit(:job_name, :job_number, :customer_name, :selling_price, 
                                       :eng_required_date_at, :actual_start_at, :actual_end_at, 
                                       :work_status, :entry_date, :weeks_estimate, :weeks_engineering, 
                                       elevators_attributes: [:id, :subdivision, :description, :elevator_type])
    end

    def contract_statuses_stats
      @work_statuses = Contract.work_statuses
      @work_statuses_count = Contract.group(:work_status).count
    end
end
