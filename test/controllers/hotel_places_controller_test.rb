require 'test_helper'

class HotelPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_place = hotel_places(:one)
  end

  test "should get index" do
    get hotel_places_url
    assert_response :success
  end

  test "should get new" do
    get new_hotel_place_url
    assert_response :success
  end

  test "should create hotel_place" do
    assert_difference('HotelPlace.count') do
      post hotel_places_url, params: { hotel_place: { city: @hotel_place.city, city_code: @hotel_place.city_code, description: @hotel_place.description, email_addresses: @hotel_place.email_addresses, name: @hotel_place.name, numer: @hotel_place.numer, phone_numbers: @hotel_place.phone_numbers, street: @hotel_place.street, user_id: @hotel_place.user_id } }
    end

    assert_redirected_to hotel_place_url(HotelPlace.last)
  end

  test "should show hotel_place" do
    get hotel_place_url(@hotel_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotel_place_url(@hotel_place)
    assert_response :success
  end

  test "should update hotel_place" do
    patch hotel_place_url(@hotel_place), params: { hotel_place: { city: @hotel_place.city, city_code: @hotel_place.city_code, description: @hotel_place.description, email_addresses: @hotel_place.email_addresses, name: @hotel_place.name, numer: @hotel_place.numer, phone_numbers: @hotel_place.phone_numbers, street: @hotel_place.street, user_id: @hotel_place.user_id } }
    assert_redirected_to hotel_place_url(@hotel_place)
  end

  test "should destroy hotel_place" do
    assert_difference('HotelPlace.count', -1) do
      delete hotel_place_url(@hotel_place)
    end

    assert_redirected_to hotel_places_url
  end
end
