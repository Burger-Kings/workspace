class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
      if @order_detail.update(order_detail_params)
        @order.update(status: 2) if @order_detail.making_status == 2
        @order_details.each do |order_detail|
          if order_detail.making_status != 3
            is_updated = false
          end
        end
        @order.update(status: 3) if is_updated == true
      end
      redirect_to admin_order_path(@order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end
end
