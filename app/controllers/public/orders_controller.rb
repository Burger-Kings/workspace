class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end
  
  def confirm
    @order = Order.new
    @cart_items = CartItem.current_customer.cart_items
  end 
  
  def complete
  end 
  
  def create
  end 

end
