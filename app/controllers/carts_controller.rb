class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  # GET /carts
  # GET /carts.json
  def index
    redirect_to action: "show", id: session[:cart_id]
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end
end
