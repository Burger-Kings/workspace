class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == '会員'
      @content = params[:content]
      @records = Customer.search_for(@content).page(params[:page])
    else
      @content = params[:content]
      @records = Item.search_for(@content).page(params[:page])
    end
  end

end
