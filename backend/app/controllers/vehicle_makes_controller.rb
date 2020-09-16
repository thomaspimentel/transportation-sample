class VehicleMakesController < ApplicationController
    before_action :set_vehicle_make, only: [:show, :edit, :update, :destroy]

    def index
        @vehicle_makes = VehicleMake.all
    end

    def show
        render json: @vehicle_make
    end

    def create
        @vehicle_make = VehicleMake.new(vehicle_make_params)
        
        if @vehicle_make.save
            render json: @vehicle_make
        else
            render json: @vehicle_make.errors, status: :unprocessable_entity
        end
    end

    def update
        if @vehicle_make.update(vehicle_make_params)
            render json: @vehicle_make
        else
            render json: @vehicle_make.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @vehicle_make.destroy
        head :no_content
    end

    private
        def set_vehicle_make
            @vehicle_make = VehicleMake.find(params[:id])
        end

        def vehicle_make_params
            params.require(:vehicle_make).permit(
                :name
            )
        end
end
