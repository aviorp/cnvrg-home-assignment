module Api
    module V1
        class DriversController < ApplicationController
            def index 
                drivers = Driver.includes(:cars)
                render :json => drivers.to_json( :include => [:cars] ), status: :ok
            end
            
            def show
                drivers = Driver.includes(:cars).find(params[:id])
                render :json => drivers.to_json( :include => [:cars] ), status: :ok
            end

            def create
                driver = Driver.new(driver_params)
                driver.save
                render json:driver, status: :created
            end

            private
            def driver_params
                params.require(:driver).permit(:name , :email)
            end
        end
    end
end