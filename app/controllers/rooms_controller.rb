class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_all_room_properties
  before_action :set_all_room_types
  before_action :set_bathroom_types

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit

  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)

      @room.properties_of_rooms.destroy_all
      @room.room_types.destroy_all

      properties_ids = params[:room][:room_properties].reject { |c| c.empty? }
      properties = RoomProperty.find(properties_ids)
      properties.each do |property|
        @room.properties_of_rooms.create(room_property: property)
      end

      types_ids = params[:room][:type_of_rooms].reject { |c| c.empty? }
      types = TypeOfRoom.find(types_ids)
      types.each do |type|
        @room.room_types.create(type_of_room: type)
      end

      redirect_to @room
    else
      render :edit
    end
  end


  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:name, :count_of_person, :price, :bathroom, :description)
  end

  def set_bathroom_types
    @bathroom_types = [1 => 'inside the room', 2 => 'outside the room but only to use by room locators', 3 => 'outside the room, available for others']
  end

  def set_all_room_properties
    @all_room_properties = RoomProperty.all.map do |property|
      [property.name, property.id]
    end
  end

  def set_all_room_types
    @all_room_types = TypeOfRoom.all.map do |type|
      [type.name, type.id]
    end
  end

end
