require 'test_helper'

class RoomTypeOfRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_type_of_room = room_type_of_rooms(:one)
  end

  test "should get index" do
    get room_type_of_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_type_of_room_url
    assert_response :success
  end

  test "should create room_type_of_room" do
    assert_difference('RoomTypeOfRoom.count') do
      post room_type_of_rooms_url, params: { room_type_of_room: { room_id: @room_type_of_room.room_id, type_of_room_id: @room_type_of_room.type_of_room_id } }
    end

    assert_redirected_to room_type_of_room_url(RoomTypeOfRoom.last)
  end

  test "should show room_type_of_room" do
    get room_type_of_room_url(@room_type_of_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_type_of_room_url(@room_type_of_room)
    assert_response :success
  end

  test "should update room_type_of_room" do
    patch room_type_of_room_url(@room_type_of_room), params: { room_type_of_room: { room_id: @room_type_of_room.room_id, type_of_room_id: @room_type_of_room.type_of_room_id } }
    assert_redirected_to room_type_of_room_url(@room_type_of_room)
  end

  test "should destroy room_type_of_room" do
    assert_difference('RoomTypeOfRoom.count', -1) do
      delete room_type_of_room_url(@room_type_of_room)
    end

    assert_redirected_to room_type_of_rooms_url
  end
end
