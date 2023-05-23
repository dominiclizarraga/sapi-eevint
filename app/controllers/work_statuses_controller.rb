class WorkStatusesController < ApplicationController
  before_action :set_work_status, only: %i[ show edit update destroy ]

  # GET /work_statuses or /work_statuses.json
  def index
    @work_statuses = WorkStatus.all
  end

  # GET /work_statuses/1 or /work_statuses/1.json
  def show
  end

  # GET /work_statuses/new
  def new
    @work_status = WorkStatus.new
  end

  # GET /work_statuses/1/edit
  def edit
  end

  # POST /work_statuses or /work_statuses.json
  def create
    @work_status = WorkStatus.new(work_status_params)

    respond_to do |format|
      if @work_status.save
        format.html { redirect_to work_status_url(@work_status), notice: "Work status was successfully created." }
        format.json { render :show, status: :created, location: @work_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_statuses/1 or /work_statuses/1.json
  def update
    respond_to do |format|
      if @work_status.update(work_status_params)
        format.html { redirect_to work_status_url(@work_status), notice: "Work status was successfully updated." }
        format.json { render :show, status: :ok, location: @work_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_statuses/1 or /work_statuses/1.json
  def destroy
    @work_status.destroy

    respond_to do |format|
      format.html { redirect_to work_statuses_url, notice: "Work status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_status
      @work_status = WorkStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_status_params
      params.require(:work_status).permit(:work_status)
    end
end
