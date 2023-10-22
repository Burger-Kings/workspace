class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @tax =1.1
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == 1
    end
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
    params.require(:order).permit(:address, :name, :shipping_fee, :total_price, :payment_method, :status)
  end
end
