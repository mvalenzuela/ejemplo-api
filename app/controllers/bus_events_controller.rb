class BusEventsController < ApplicationController
  before_action :set_bus_event, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @bus_events = BusEvent.all
    json_response(@bus_events)
  end

  # POST /todos
  def create
    @bus_event = BusEvent.create!(bus_event_params)
    json_response(@bus_event, :created)
  end

  # GET /todos/:id
  def show
    json_response(@bus_event)
  end

  # PUT /todos/:id
  def update
    @bus_event.update(bus_event_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @bus_event.destroy
    head :no_content
  end

  private

  def bus_event_params
    # whitelist params
    params.permit(:plate_code, :speed)
  end

  def set_bus_event
    @bus_event = BusEvent.find(params[:id])
  end
end
