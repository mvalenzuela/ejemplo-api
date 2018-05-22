class BusStopsController < ApplicationController
  before_action :set_bus, only: [:show, :update, :destroy]

    # GET /todos
    def index
      @bus_stops = BusStop.all
      json_response(@bus_stops)
    end

    # POST /todos
    def create
      @bus_stop = BusStop.create!(bus_params)
      json_response(@bus_stop, :created)
    end

    # GET /todos/:id
    def show
      json_response(@bus_stop)
    end

    # PUT /todos/:id
    def update
      @bus_stop.update(bus_stop_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @bus_stop.destroy
      head :no_content
    end

    private

    def bus_stop_params
      # whitelist params
      params.permit(:code, :location, :name)
    end

    def set_bus_stop
      @bus_stop = BusStop.find(params[:id])
    end
end
