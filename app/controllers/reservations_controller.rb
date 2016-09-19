class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :get_rooms, only: [:new, :create, :edit, :update, :destroy]

  respond_to :json, :html, only: :get_room

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show

  end

  def get_room
    @room = Room.find params[:id]
    respond_with @room
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @reservation.status = "created"
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      @reservation = Reservation.find(params[:id])
      if @reservation.update_attributes(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was canceled.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :cancel_visit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel_visit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :changed_price, :proper_price, :changed_count_of_person, :email, :room_id, :status)
  end

  def get_rooms
    @rooms = Room.all.map do |type|
      [type.name, type.id]
    end
  end

end
