class MeetingMinutesController < ApplicationController
  before_action :set_meeting_minute, only: %i[show edit update destroy]
  before_action :set_organization


  # GET /meeting_minutes or /meeting_minutes.json
  def index
    @meeting_minutes = @organization.meeting_minutes
  end

  # GET /meeting_minutes/1 or /meeting_minutes/1.json
  def show
  end

  # GET /meeting_minutes/new
  def new
    @organization = Organization.find(params[:organization_id])
    @meeting_minute = @organization.meeting_minutes.build
  end

  # GET /meeting_minutes/1/edit
  def edit
  end

  # POST /meeting_minutes or /meeting_minutes.json
  def create
    @meeting_minute = MeetingMinute.new(meeting_minute_params)
    @organization = Organization.find(params[:organization_id])


    respond_to do |format|
      if @meeting_minute.save
        format.html { redirect_to organization_meeting_minute_path(@organization, @meeting_minute), notice: "Meeting minute was successfully created." }
        format.json { render :show, status: :created, location: @meeting_minute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_minutes/1 or /meeting_minutes/1.json
  def update
    respond_to do |format|
      if @meeting_minute.update(meeting_minute_params)
        format.html { redirect_to organization_meeting_minute_path(@organization, @meeting_minute), notice: "Meeting minute was successfully updated." }
        format.json { render :show, status: :ok, location: @meeting_minute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_minutes/1 or /meeting_minutes/1.json
  def destroy
    @meeting_minute.destroy

    respond_to do |format|
      format.html { redirect_to meeting_minutes_url, notice: "Meeting minute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
  
  def set_meeting_minute
    @meeting_minute = MeetingMinute.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_minute_params
    params.require(:meeting_minute).permit(:content, :meeting_date, :organization_id)
  end
end
