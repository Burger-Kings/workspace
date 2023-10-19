class Public::OrdersController < ApplicationController

def new
end

def index
 @orders = current_customer.orders
end

def show
 @order = Order.find(params[:id])
 @order_items = @order.order_details.all
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
