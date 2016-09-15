class RoomRoomPropertiesController < ApplicationController
  before_action :set_room_room_property, only: [:show, :edit, :update, :destroy]

  # GET /room_room_properties
  # GET /room_room_properties.json
  def index
    @room_room_properties = RoomRoomProperty.all
  end

  # GET /room_room_properties/1
  # GET /room_room_properties/1.json
  def show
  end

  # GET /room_room_properties/new
  def new
    @room_room_property = RoomRoomProperty.new
  end

  # GET /room_room_properties/1/edit
  def edit
  end

  # POST /room_room_properties
  # POST /room_room_properties.json
  def create
    @room_room_property = RoomRoomProperty.new(room_room_property_params)

    respond_to do |format|
      if @room_room_property.save
        format.html { redirect_to @room_room_property, notice: 'Room room property was successfully created.' }
        format.json { render :show, status: :created, location: @room_room_property }
      else
        format.html { render :new }
        format.json { render json: @room_room_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_room_properties/1
  # PATCH/PUT /room_room_properties/1.json
  def update
    respond_to do |format|
      if @room_room_property.update(room_room_property_params)
        format.html { redirect_to @room_room_property, notice: 'Room room property was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_room_property }
      else
        format.html { render :edit }
        format.json { render json: @room_room_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_room_properties/1
  # DELETE /room_room_properties/1.json
  def destroy
    @room_room_property.destroy
    respond_to do |format|
      format.html { redirect_to room_room_properties_url, notice: 'Room room property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_room_property
      @room_room_property = RoomRoomProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_room_property_params
      params.require(:room_room_property).permit(:room_id, :room_properties_id)
    end
end
