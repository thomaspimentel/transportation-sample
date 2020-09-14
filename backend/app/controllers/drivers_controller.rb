class DriversController < ApplicationController
    before_action :set_driver, only: [:show, :update, :destroy]
    before_action :set_event, only: [:index, :create]

    def index
        @drivers = @event.drivers
    end

    def create
        driver = @event.drivers.create(driver_params)
        render json: driver
    end

    private
        def set_driver
            @driver = Driver.find(params[:id])
        end

        def set_event
            @event = Event.includes(:drivers).find(params[:event_id])
        end

        def driver_params
            params.require(:driver).permit(
                :first_name,
                :last_name,
                :email,
                :date_of_birth,
                :phone_number
            )
        end
end
