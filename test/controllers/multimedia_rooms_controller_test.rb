require 'test_helper'

class MultimediaRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multimedia_room = multimedia_rooms(:one)
  end

  test "should get index" do
    get multimedia_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_multimedia_room_url
    assert_response :success
  end

  test "should create multimedia_room" do
    assert_difference('MultimediaRoom.count') do
      post multimedia_rooms_url, params: { multimedia_room: { multimedia_id: @multimedia_room.multimedia_id, room_id: @multimedia_room.room_id, type_of_display: @multimedia_room.type_of_display } }
    end

    assert_redirected_to multimedia_room_url(MultimediaRoom.last)
  end

  test "should show multimedia_room" do
    get multimedia_room_url(@multimedia_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_multimedia_room_url(@multimedia_room)
    assert_response :success
  end

  test "should update multimedia_room" do
    patch multimedia_room_url(@multimedia_room), params: { multimedia_room: { multimedia_id: @multimedia_room.multimedia_id, room_id: @multimedia_room.room_id, type_of_display: @multimedia_room.type_of_display } }
    assert_redirected_to multimedia_room_url(@multimedia_room)
  end

  test "should destroy multimedia_room" do
    assert_difference('MultimediaRoom.count', -1) do
      delete multimedia_room_url(@multimedia_room)
    end

    assert_redirected_to multimedia_rooms_url
  end
end
