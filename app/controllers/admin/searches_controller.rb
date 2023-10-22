class Admin::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @records = Customer.search_for(@content)
  end

  def search_items

  end
end
