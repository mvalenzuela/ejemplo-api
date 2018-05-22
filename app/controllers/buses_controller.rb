class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :update, :destroy]

    # GET /todos
    def index
      @buses = Bus.all
      json_response(@buses)
    end

    # POST /todos
    def create
      @bus = Bus.create!(bus_params)
      json_response(@bus, :created)
    end

    # GET /todos/:id
    def show
      json_response(@bus)
    end

    # PUT /todos/:id
    def update
      @bus.update(bus_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @bus.destroy
      head :no_content
    end

    private

    def bus_params
      # whitelist params
      params.permit(:route, :arrival_estimation)
    end

    def set_bus
      @bus = Bus.find(params[:id])
    end
end
