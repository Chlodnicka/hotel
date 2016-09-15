require 'test_helper'

class RoomRoomPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_room_property = room_room_properties(:one)
  end

  test "should get index" do
    get room_room_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_room_room_property_url
    assert_response :success
  end

  test "should create room_room_property" do
    assert_difference('RoomRoomProperty.count') do
      post room_room_properties_url, params: { room_room_property: { room_id: @room_room_property.room_id, room_properties_id: @room_room_property.room_properties_id } }
    end

    assert_redirected_to room_room_property_url(RoomRoomProperty.last)
  end

  test "should show room_room_property" do
    get room_room_property_url(@room_room_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_room_property_url(@room_room_property)
    assert_response :success
  end

  test "should update room_room_property" do
    patch room_room_property_url(@room_room_property), params: { room_room_property: { room_id: @room_room_property.room_id, room_properties_id: @room_room_property.room_properties_id } }
    assert_redirected_to room_room_property_url(@room_room_property)
  end

  test "should destroy room_room_property" do
    assert_difference('RoomRoomProperty.count', -1) do
      delete room_room_property_url(@room_room_property)
    end

    assert_redirected_to room_room_properties_url
  end
end
