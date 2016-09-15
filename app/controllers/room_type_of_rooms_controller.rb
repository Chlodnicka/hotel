class RoomTypeOfRoomsController < ApplicationController
  before_action :set_room_type_of_room, only: [:show, :edit, :update, :destroy]

  # GET /room_type_of_rooms
  # GET /room_type_of_rooms.json
  def index
    @room_type_of_rooms = RoomTypeOfRoom.all
  end

  # GET /room_type_of_rooms/1
  # GET /room_type_of_rooms/1.json
  def show
  end

  # GET /room_type_of_rooms/new
  def new
    @room_type_of_room = RoomTypeOfRoom.new
  end

  # GET /room_type_of_rooms/1/edit
  def edit
  end

  # POST /room_type_of_rooms
  # POST /room_type_of_rooms.json
  def create
    @room_type_of_room = RoomTypeOfRoom.new(room_type_of_room_params)

    respond_to do |format|
      if @room_type_of_room.save
        format.html { redirect_to @room_type_of_room, notice: 'Room type of room was successfully created.' }
        format.json { render :show, status: :created, location: @room_type_of_room }
      else
        format.html { render :new }
        format.json { render json: @room_type_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_type_of_rooms/1
  # PATCH/PUT /room_type_of_rooms/1.json
  def update
    respond_to do |format|
      if @room_type_of_room.update(room_type_of_room_params)
        format.html { redirect_to @room_type_of_room, notice: 'Room type of room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_type_of_room }
      else
        format.html { render :edit }
        format.json { render json: @room_type_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_type_of_rooms/1
  # DELETE /room_type_of_rooms/1.json
  def destroy
    @room_type_of_room.destroy
    respond_to do |format|
      format.html { redirect_to room_type_of_rooms_url, notice: 'Room type of room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type_of_room
      @room_type_of_room = RoomTypeOfRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_type_of_room_params
      params.require(:room_type_of_room).permit(:room_id, :type_of_room_id)
    end
end
