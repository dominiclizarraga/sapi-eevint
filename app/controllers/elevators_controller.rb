class ElevatorsController < ApplicationController
  before_action :set_contract
  before_action :set_elevator, only: %i[ show edit update destroy ]

  # GET /elevators or /elevators.json
  def index
    @contract = Contract.find(params[:contract_id])
    @elevators = @contract.elevators
  end

  # GET /elevators/1 or /elevators/1.json
  def show
  end

  # GET /elevators/new
  def new
    @elevator = @contract.elevators.new
    # @elevator.work_statuses.build
  end

  # GET /elevators/1/edit
  def edit
  end

  # POST /elevators or /elevators.json
  def create
    @elevator = @contract.elevators.new(elevator_params)
    respond_to do |format|
      if @elevator.save
        format.html { redirect_to contract_path(@contract), notice: "Elevator was successfully created." }
        format.json { render :show, status: :created, location: @elevator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @elevator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elevators/1 or /elevators/1.json
  def update
    respond_to do |format|
      if @elevator.update(elevator_params)
        format.html { redirect_to contract_elevator_path(@contract, @elevator), notice: "Elevator was successfully updated." }
        format.json { render :show, status: :ok, location: @elevator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @elevator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elevators/1 or /elevators/1.json
  def destroy
    @elevator.destroy

    respond_to do |format|
      format.html { redirect_to contract_elevators_path(@contract), notice: "Elevator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elevator
      @elevator = @contract.elevators.find(params[:id])
    end

    def set_contract
      @contract = Contract.find(params[:contract_id])
    end

    # Only allow a list of trusted parameters through.
    def elevator_params
      params.require(:elevator).permit(:elevator_type, :description, :subdivision, :contract_id)
    end
end
