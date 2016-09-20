class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_cart
    if session[:cart_id]
      @current_cart||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.status == "paid"
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!(:status => 'created', :ip_address => request.remote_ip)
      session[:cart_id] = @current_cart.id
    end
  end
end
