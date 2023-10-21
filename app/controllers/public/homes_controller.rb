class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genre = Genre.all
  end

  def about
  end
end
