class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id)
    @order_items = @order.order_details
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_items = OrderDetail.new
      @order_items.order_id = @order.id
      @order_items.item_id = cart_item.item_id
      @order_items.amount = cart_item.amount
      @order_items.price = (cart_item.item.price * 1.1).floor
      if @order_items.save
        current_customer.cart_items.destroy_all
      end
    end
    redirect_to orders_complete_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    case params[:order][:address_option]
    when "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    when "1"
      addresses = Address.find_by(id: params[:order][:customer_id])

      if addresses
        @order.postal_code = addresses.postal_code
        @order.address = addresses.address
        @order.name = addresses.name
      else
        flash[:error] = "配送先が登録されていません"
        redirect_to new_order_path
      end
    when "2"
      if params[:order][:postal_code].blank? || params[:order][:address].blank? || params[:order][:name].blank?
        flash[:error] = "配送先が入力されていません"
        redirect_to new_order_path
      else
        @order.customer_id = current_customer.id
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :status, :shipping_fee, :total_price, :payment_method)
  end
end
