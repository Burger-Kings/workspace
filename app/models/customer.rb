class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def self.search_for(content)
    Customer.where("last_name LIKE ? or first_name LIKE ?", "%#{content}%", "%#{content}%")
  end
  
  def active_for_authentication?
    super && (self.is_active == false)
  end
end
