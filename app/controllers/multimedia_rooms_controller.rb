class MultimediaRoomsController < ApplicationController
  before_action :set_multimedia_room, only: [:show, :edit, :update, :destroy]

  # GET /multimedia_rooms
  # GET /multimedia_rooms.json
  def index
    @multimedia_rooms = MultimediaRoom.all
  end

  # GET /multimedia_rooms/1
  # GET /multimedia_rooms/1.json
  def show
  end

  # GET /multimedia_rooms/new
  def new
    @multimedia_room = MultimediaRoom.new
  end

  # GET /multimedia_rooms/1/edit
  def edit
  end

  # POST /multimedia_rooms
  # POST /multimedia_rooms.json
  def create
    @multimedia_room = MultimediaRoom.new(multimedia_room_params)

    respond_to do |format|
      if @multimedia_room.save
        format.html { redirect_to @multimedia_room, notice: 'Multimedia room was successfully created.' }
        format.json { render :show, status: :created, location: @multimedia_room }
      else
        format.html { render :new }
        format.json { render json: @multimedia_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia_rooms/1
  # PATCH/PUT /multimedia_rooms/1.json
  def update
    respond_to do |format|
      if @multimedia_room.update(multimedia_room_params)
        format.html { redirect_to @multimedia_room, notice: 'Multimedia room was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedia_room }
      else
        format.html { render :edit }
        format.json { render json: @multimedia_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia_rooms/1
  # DELETE /multimedia_rooms/1.json
  def destroy
    @multimedia_room.destroy
    respond_to do |format|
      format.html { redirect_to multimedia_rooms_url, notice: 'Multimedia room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedia_room
      @multimedia_room = MultimediaRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multimedia_room_params
      params.require(:multimedia_room).permit(:room_id, :multimedia_id, :type_of_display)
    end
end
