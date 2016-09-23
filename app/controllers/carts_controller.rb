class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :index]

  # GET /carts
  # GET /carts.json
  def index
    redirect_to action: "show", id: @cart.id
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

end
