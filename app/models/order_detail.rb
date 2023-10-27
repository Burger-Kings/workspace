class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :amount, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :making_status, presence: true

  enum making_status: { impossible: 0, waiting_making: 1, making: 2, finished: 3 }

  def subtotal
    price * amount
  end

end
