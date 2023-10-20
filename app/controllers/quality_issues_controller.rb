class QualityIssuesController < ApplicationController
  before_action :set_quality_issue, only: [:show, :edit, :update, :destroy]

  before_action :set_contract, only: [:show, :edit, :update]


  # GET /quality_issues
  def index
    # @contract = Contract.find(params[:contract_id]) # or however you're setting it
    @quality_issues = QualityIssue.includes(:contract).all
  end
  

  # GET /quality_issues/:id
  def show
  end

  # GET /quality_issues/new
  def new
    @quality_issue = QualityIssue.new
    @contracts = Contract.all # This is to populate the dropdown for job_number and customer_name
  end

  # POST /quality_issues
  def create
    @quality_issue = QualityIssue.new(quality_issue_params)
    if @quality_issue.save
      redirect_to @quality_issue, notice: 'Quality issue was successfully created.'
    else
      render :new
    end
  end

  # GET /quality_issues/:id/edit
  def edit
      @contract = Contract.find(params[:contract_id])
  @quality_issue = @contract.quality_issues.new
  end

  # PATCH/PUT /quality_issues/:id
  def update
    if @quality_issue.update(quality_issue_params)
      redirect_to @quality_issue, notice: 'Quality issue was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quality_issues/:id
  def destroy
    @quality_issue.destroy
    redirect_to quality_issues_url, notice: 'Quality issue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quality_issue
      @quality_issue = QualityIssue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quality_issue_params
      params.require(:quality_issue).permit(:contract_id, :date, :description, :severity)
    end

    def set_contract
      # @contract = Contract.find(params[:contract_id])
    end
end
