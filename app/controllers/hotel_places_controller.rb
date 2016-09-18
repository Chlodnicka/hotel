class HotelPlacesController < ApplicationController
  before_action :set_hotel_place, only: [:show, :edit, :update, :destroy, :add_photos, :update_photos]

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

  def add_photos
    @multimedia = Multimedium.all
    @conntected_images = @hotel_place.multimedia_hotels.map do |multimedia|
      multimedia.multimedia_id
    end
  end

  def update_photos
    @hotel_place = HotelPlace.find(params[:id])
    @hotel_place.multimedia_hotels.destroy_all

    hotelgallery_id = params[:hotelgallery].reject { |c| c.empty? }
    images = Multimedium.find(hotelgallery_id)
    puts images
    images.each do |image|
      @hotel_place.multimedia_hotels.create(multimedia_id: image.id)
    end

    redirect_to @hotel_place
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
