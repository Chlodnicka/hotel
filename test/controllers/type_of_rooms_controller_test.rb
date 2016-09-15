require 'test_helper'

class TypeOfRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_room = type_of_rooms(:one)
  end

  test "should get index" do
    get type_of_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_room_url
    assert_response :success
  end

  test "should create type_of_room" do
    assert_difference('TypeOfRoom.count') do
      post type_of_rooms_url, params: { type_of_room: { name: @type_of_room.name } }
    end

    assert_redirected_to type_of_room_url(TypeOfRoom.last)
  end

  test "should show type_of_room" do
    get type_of_room_url(@type_of_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_room_url(@type_of_room)
    assert_response :success
  end

  test "should update type_of_room" do
    patch type_of_room_url(@type_of_room), params: { type_of_room: { name: @type_of_room.name } }
    assert_redirected_to type_of_room_url(@type_of_room)
  end

  test "should destroy type_of_room" do
    assert_difference('TypeOfRoom.count', -1) do
      delete type_of_room_url(@type_of_room)
    end

    assert_redirected_to type_of_rooms_url
  end
end
