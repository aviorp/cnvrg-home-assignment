# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cars = [
    {
        id: 100,
        name: "Lamborghini Urus",
        img:
          "https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/model_detail/urus/2021/03_16/urus_s2_m.jpg",
         carType: "Luxury",
         color:"black"
      },
      {
        id: 101,
        name: "Subaru",
        img:
          "https://www.auto-data.net/images/f106/Subaru-WRX-STI-facelift-2018.jpg",
          carType: "Sports",
          color:"black"
       
      },
      {
        id: 103,
        name: "Hyundai",
        img:"https://www.automag.co.il/wp-content/uploads/2020/10/hyundai-all-new-i20-n-03.jpg",
        carType: "Family",
        color:"white"
        
      },
      {
        id: 104,
        name: "Bmw",
        img:
          "https://www.bmw.co.il/content/dam/bmw/common/all-models/1-series/5-door/2019/navigation/bmw-1-series-modelfinder.png",
          carType: "Sports",
          color:"black"
       
      },
      {
        id: 105,
        name: "Suzuki",
        img:
          "https://www.suzuki.co.il/files/76bdce58c4f0e8809891b4e45dcaeda6/styles/model_gallery_big_image/public/field/image/17253%20jimny%20picture%201270x691%20b3_0.jpg?itok=aWdhFXLL",
          carType: "SUV",
          color:"black"
      
      },
      {
        id: 106,
        name: "Mercedes",
        img:
          "https://luxury-motors.co.il/wp-content/uploads/2019/11/ea582682-81fc-4e7c-9917-ef347e22b51c.jpg",
          carType: "Luxury",
          color:"black"
      },
]

drivers = [
    {
      id: 100,
      name: "Avior",
      email:"Avior@example.com"
    },
    {
      id: 101,
      name: "Avior1",
      email:"Avior1@example.com"
    },
    {
      id: 102,
      name: "Avior2",
      email:"Avior2@example.com"
    },
    {
      id: 103,
      name: "Avior3",
      email:"Avior3@example.com"
    },
    {
      id: 104,
      name: "Avior4",
      email:"Avior4@example.com"
    },
    {
      id: 105,
      name: "Avior5",
      email:"Avior5@example.com"
    },
    {
      id: 106,
      name: "Avior6",
      email:"Avior6@example.com"
    },
  ]

driver_cars = [
    {
      car_id: 100,
      driver_id: 100
    },
    {
      car_id: 101,
      driver_id: 101
    },
    {
      car_id: 102,
      driver_id: 102
    },
    {
      car_id: 103,
      driver_id: 103
    },
    {
      car_id: 104,
      driver_id: 104
    },
    {
      car_id: 105,
      driver_id: 105
    },
    {
      car_id: 106,
      driver_id: 106
    },
  ]
  Driver.create(drivers)
  Car.create(cars)
  DriverCar.create(driver_cars)