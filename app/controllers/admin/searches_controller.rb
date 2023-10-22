class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == '会員'
      @content = params[:content]
      @records = Customer.search_for(@content)
    else
      @content = params[:content]
      @records = Item.search_for(@content)
    end
  end

  def search_items

  end
end
