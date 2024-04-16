class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_organization

  # GET /events or /events.json
  def index
    @events = @organization.events
  end

  # GET /events/1 or /events/1.json
  def show
    @organization = Organization.find(params[:organization_id])
    @event = @organization.events.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Organization or event not found."
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.organization_id = params[:organization_id]
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to organization_events_url(@event.organization), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = @organization.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to organization_events_url(@organization), notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to organization_events_url(@organization), alert: "Event not found."
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :hosting, :address, :organization_id, :start_time, :end_time)
  end
end
