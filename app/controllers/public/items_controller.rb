class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    @item_all = Item.all
    @items_count = @item_all.count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
    @amount = Item.where(genre_id: @genre_id).count
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
  end

  def search_name
    @content = params[:content]
    @records = Item.search_for(@content)
    @genres = Genre.all
  end
end