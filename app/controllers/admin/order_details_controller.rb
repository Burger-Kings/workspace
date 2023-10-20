class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details = Oder.oder_details.all
  end
end
