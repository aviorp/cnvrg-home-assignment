module Api
    module V1
        class DriverCarsController < ApplicationController
            def index 
                driver_cars = DriverCar.all()
                render :json => driver_cars, status: :ok
            end
            
            def show
                driver_car = DriverCar.find(params[:id])
                render :json => driver_car, status: :ok
            end

            def create
                driverCarArr = []
                for driver in params[:driver_id] do
                   for car in params[:car_id] do
                        model = {
                            driver_id: driver,
                            car_id: car
                        }
                        
                        driverCarArr << model
                    end
                end
                
                DriverCar.create(driverCarArr)
                
                head :no_content

            end
        end
    end
end