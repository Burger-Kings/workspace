class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: {制作不可:0, 制作待ち:1, 製作中:2, 制作完了:3 }

  #税込の小計
  def subtotal
    price * amount
  end

end
