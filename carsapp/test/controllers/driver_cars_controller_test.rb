require "test_helper"

class DriverCarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver_car = driver_cars(:one)
  end

  test "should get index" do
    get driver_cars_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_car_url
    assert_response :success
  end

  test "should create driver_car" do
    assert_difference('DriverCar.count') do
      post driver_cars_url, params: { driver_car: { car_id: @driver_car.car_id, driver_id: @driver_car.driver_id } }
    end

    assert_redirected_to driver_car_url(DriverCar.last)
  end

  test "should show driver_car" do
    get driver_car_url(@driver_car)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_car_url(@driver_car)
    assert_response :success
  end

  test "should update driver_car" do
    patch driver_car_url(@driver_car), params: { driver_car: { car_id: @driver_car.car_id, driver_id: @driver_car.driver_id } }
    assert_redirected_to driver_car_url(@driver_car)
  end

  test "should destroy driver_car" do
    assert_difference('DriverCar.count', -1) do
      delete driver_car_url(@driver_car)
    end

    assert_redirected_to driver_cars_url
  end
end
