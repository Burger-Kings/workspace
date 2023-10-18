class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @items_count = @items.size
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end