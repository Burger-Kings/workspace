class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.find(params[:id])
  end

  def update

  end
  
end
