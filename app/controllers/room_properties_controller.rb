class RoomPropertiesController < ApplicationController
  before_action :set_room_property, only: [:show, :edit, :update, :destroy]

  def show
    redirect_to settings_path
  end

  # GET /room_properties/new
  def new
    @room_property = RoomProperty.new
  end

  # GET /room_properties/1/edit
  def edit
  end

  # POST /room_properties
  # POST /room_properties.json
  def create
    @room_property = RoomProperty.new(room_property_params)

    respond_to do |format|
      if @room_property.save
        format.html { redirect_to settings_path, notice: 'Room property was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @room_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_properties/1
  # PATCH/PUT /room_properties/1.json
  def update
    respond_to do |format|
      if @room_property.update(room_property_params)
        format.html { redirect_to settings_path, notice: 'Room property was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @room_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_properties/1
  # DELETE /room_properties/1.json
  def destroy
    @room_property.destroy
    respond_to do |format|
      format.html { redirect_to settings_path, notice: 'Room property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_property
      @room_property = RoomProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_property_params
      params.require(:room_property).permit(:name)
    end
end
