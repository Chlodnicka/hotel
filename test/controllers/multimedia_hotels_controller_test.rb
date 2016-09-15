require 'test_helper'

class MultimediaHotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multimedia_hotel = multimedia_hotels(:one)
  end

  test "should get index" do
    get multimedia_hotels_url
    assert_response :success
  end

  test "should get new" do
    get new_multimedia_hotel_url
    assert_response :success
  end

  test "should create multimedia_hotel" do
    assert_difference('MultimediaHotel.count') do
      post multimedia_hotels_url, params: { multimedia_hotel: { hotel_place_id: @multimedia_hotel.hotel_place_id, multimedia_id: @multimedia_hotel.multimedia_id, type_of_display: @multimedia_hotel.type_of_display } }
    end

    assert_redirected_to multimedia_hotel_url(MultimediaHotel.last)
  end

  test "should show multimedia_hotel" do
    get multimedia_hotel_url(@multimedia_hotel)
    assert_response :success
  end

  test "should get edit" do
    get edit_multimedia_hotel_url(@multimedia_hotel)
    assert_response :success
  end

  test "should update multimedia_hotel" do
    patch multimedia_hotel_url(@multimedia_hotel), params: { multimedia_hotel: { hotel_place_id: @multimedia_hotel.hotel_place_id, multimedia_id: @multimedia_hotel.multimedia_id, type_of_display: @multimedia_hotel.type_of_display } }
    assert_redirected_to multimedia_hotel_url(@multimedia_hotel)
  end

  test "should destroy multimedia_hotel" do
    assert_difference('MultimediaHotel.count', -1) do
      delete multimedia_hotel_url(@multimedia_hotel)
    end

    assert_redirected_to multimedia_hotels_url
  end
end
