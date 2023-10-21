class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items_count = @items.size
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genre = Genre.all
  end
end