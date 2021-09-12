module Api
    module V1
        class CarsController < ApplicationController
            def index 
                cars = Car.includes(:drivers)
                render :json => cars.to_json( :include => [:drivers] ), status: :ok
            end
            
            def show
                car = Car.includes(:drivers).find(params[:id])
                render :json => car.to_json( :include => [:drivers] ), status: :ok
            end

            def create
                car = Car.new(car_params)
                car.save
                render json:car, status: :created
            end

            private
            def car_params
                params.require(:car).permit(:name, :img , :type , :color)
            end
        end
    end
end