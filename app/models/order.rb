class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :status, presence: true
  validates :shipping_fee, presence: true, numericality: true
  validates :total_price, presence: true, numericality: true
  validates :payment_method, presence: true

  enum payment_method: {credit_card:0, transfer:1}
  enum status: {waiting:0, paid_up:1, making:2, preparing:3, shipped:4 }
end
