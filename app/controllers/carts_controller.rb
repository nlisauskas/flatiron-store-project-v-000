class CartsController < ApplicationController
    def show
        @cart = Cart.find(params[:id])
    end

    def checkout
        cart = Cart.find params[:id]
        cart.checkout
       # cart.user.current_cart_id = nil
        #require 'pry'; binding.pry
        redirect_to cart_path(cart)
    end

    def index

    end

end
