class MultimediaHotelsController < ApplicationController
  before_action :set_multimedia_hotel, only: [:show, :edit, :update, :destroy]

  # GET /multimedia_hotels
  # GET /multimedia_hotels.json
  def index
    @multimedia_hotels = MultimediaHotel.all
  end

  # GET /multimedia_hotels/1
  # GET /multimedia_hotels/1.json
  def show
  end

  # GET /multimedia_hotels/new
  def new
    @multimedia_hotel = MultimediaHotel.new
  end

  # GET /multimedia_hotels/1/edit
  def edit
  end

  # POST /multimedia_hotels
  # POST /multimedia_hotels.json
  def create
    @multimedia_hotel = MultimediaHotel.new(multimedia_hotel_params)

    respond_to do |format|
      if @multimedia_hotel.save
        format.html { redirect_to @multimedia_hotel, notice: 'Multimedia hotel was successfully created.' }
        format.json { render :show, status: :created, location: @multimedia_hotel }
      else
        format.html { render :new }
        format.json { render json: @multimedia_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia_hotels/1
  # PATCH/PUT /multimedia_hotels/1.json
  def update
    respond_to do |format|
      if @multimedia_hotel.update(multimedia_hotel_params)
        format.html { redirect_to @multimedia_hotel, notice: 'Multimedia hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedia_hotel }
      else
        format.html { render :edit }
        format.json { render json: @multimedia_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia_hotels/1
  # DELETE /multimedia_hotels/1.json
  def destroy
    @multimedia_hotel.destroy
    respond_to do |format|
      format.html { redirect_to multimedia_hotels_url, notice: 'Multimedia hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedia_hotel
      @multimedia_hotel = MultimediaHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multimedia_hotel_params
      params.require(:multimedia_hotel).permit(:hotel_place_id, :multimedia_id, :type_of_display)
    end
end
