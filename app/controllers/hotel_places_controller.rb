class HotelPlacesController < ApplicationController
  before_action :set_hotel_place, only: [:show, :edit, :update, :destroy]

  def index
    @hotel_place = HotelPlace.first
    redirect_to action: "show", id: @hotel_place.id
  end

  # GET /hotel_places/1
  # GET /hotel_places/1.json
  def show
  end

  # GET /hotel_places/1/edit
  def edit
  end


  def update
    respond_to do |format|
      if @hotel_place.update(hotel_place_params)
        format.html { redirect_to @hotel_place, notice: 'Hotel place was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_place }
      else
        format.html { render :edit }
        format.json { render json: @hotel_place.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_place
      @hotel_place = HotelPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_place_params
      params.require(:hotel_place).permit(:name, :street, :numer, :city_code, :city, :phone_numbers, :email_addresses, :description, :user_id)
    end
end
