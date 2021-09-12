class Driver < ApplicationRecord
    has_many :driver_cars
    has_many :cars, through: :driver_cars
end
