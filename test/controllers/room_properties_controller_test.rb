require 'test_helper'

class RoomPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_property = room_properties(:one)
  end

  test "should get index" do
    get room_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_room_property_url
    assert_response :success
  end

  test "should create room_property" do
    assert_difference('RoomProperty.count') do
      post room_properties_url, params: { room_property: { name: @room_property.name } }
    end

    assert_redirected_to room_property_url(RoomProperty.last)
  end

  test "should show room_property" do
    get room_property_url(@room_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_property_url(@room_property)
    assert_response :success
  end

  test "should update room_property" do
    patch room_property_url(@room_property), params: { room_property: { name: @room_property.name } }
    assert_redirected_to room_property_url(@room_property)
  end

  test "should destroy room_property" do
    assert_difference('RoomProperty.count', -1) do
      delete room_property_url(@room_property)
    end

    assert_redirected_to room_properties_url
  end
end
