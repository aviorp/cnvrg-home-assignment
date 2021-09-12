require "application_system_test_case"

class DriverCarsTest < ApplicationSystemTestCase
  setup do
    @driver_car = driver_cars(:one)
  end

  test "visiting the index" do
    visit driver_cars_url
    assert_selector "h1", text: "Driver Cars"
  end

  test "creating a Driver car" do
    visit driver_cars_url
    click_on "New Driver Car"

    fill_in "Car", with: @driver_car.car_id
    fill_in "Driver", with: @driver_car.driver_id
    click_on "Create Driver car"

    assert_text "Driver car was successfully created"
    click_on "Back"
  end

  test "updating a Driver car" do
    visit driver_cars_url
    click_on "Edit", match: :first

    fill_in "Car", with: @driver_car.car_id
    fill_in "Driver", with: @driver_car.driver_id
    click_on "Update Driver car"

    assert_text "Driver car was successfully updated"
    click_on "Back"
  end

  test "destroying a Driver car" do
    visit driver_cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Driver car was successfully destroyed"
  end
end
