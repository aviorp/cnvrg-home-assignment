class Car < ApplicationRecord
    # define assosiation between cars and drivers
    has_many :driver_cars
    has_many :drivers, through: :driver_cars
end
