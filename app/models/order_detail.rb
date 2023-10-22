class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { impossible: 0, waiting_making: 1, making: 2, finished: 3 }

  #税込の小計
  def subtotal
    price * amount
  end

end
