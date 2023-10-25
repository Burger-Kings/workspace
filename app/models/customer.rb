class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postal_code, presence: true, length: {is: 7}
  validates :address, presence: true, length: { maximum: 50 }
  validates :telephone_number, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  def self.search_for(content)
    Customer.where("last_name LIKE ? or first_name LIKE ? or last_name_kana LIKE ? or first_name_kana LIKE ?", "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%")
  end

  def active_for_authentication?
    super && (self.is_active == true)
  end
end
