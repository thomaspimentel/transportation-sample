class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :update, :destroy]
    before_action :set_event, only: [:index, :create]

    def index
        @vehicles = @event.vehicles
    end

    def create
        vehicle = @event.vehicles.build(vehicle_params)
        if vehicle.save
            render json: vehicle
        else
            render json: vehicle.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @vehicle
    end

    def update
        if @vehicle.update(vehicle_params)
            render json: @vehicle
        else
            render json: @vehicle.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @vehicle.destroy
        head :no_content
    end

    private
        def set_vehicle
            @vehicle = Vehicle.find(params[:id])
        end

        def set_event
            @event = Event.includes(:vehicles).find(params[:event_id])
        end

        def vehicle_params
            params.require(:vehicle).permit(
                :username,
                :year,
                :license,
                :color,
                :rider_capacity,
            )
        end
end
