class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items_count = Item.count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    items_per_page = 8
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id).page(params[:page]).per(items_per_page)
    @amount = Item.where(genre_id: @genre_id).count
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
  end

  def search_name
    items_per_page = 8
    @content = params[:content]
    @records = Item.search_for(@content).page(params[:page]).per(items_per_page)
    @genres = Genre.all
  end
end
