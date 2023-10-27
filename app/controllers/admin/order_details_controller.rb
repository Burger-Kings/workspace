class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
      if @order_detail.update(order_detail_params)
        @order.update(status: "making") if @order_detail.making_status == "making"
        @order_details.each do |order_detail|
          if order_detail.making_status != "finished"
            is_updated = false
          end
        end
        @order.update(status: "preparing") if is_updated == true
        redirect_to admin_order_path(@order)
      else
        render template: "admin/orders/show"
      end
  end

  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end
end
