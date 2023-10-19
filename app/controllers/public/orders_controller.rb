class Public::OrdersController < ApplicationController
  
def new
 @order = Order.new
 @addresses = current_customer.addresses.all
end

def index
 @orders = current_customer.orders
end

def show
 @order = Order.find(params[:id])
 @order_detail = @order.order_details
end

def create
end

def confirm
  @order = Order.new(order_params)
  @cart_items = CartItem.current_customer.cart_items
end

def complete
end

private

def order_params
params.require(:order).permit(:customer_id, :name, :postal_code, :address, :status, :shipping_fee, :total_price, :payment_method)
end

end
