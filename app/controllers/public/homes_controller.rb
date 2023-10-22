class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @last_records = Item.order(created_at: :desc).limit(4)
  end

  def about
  end
end
