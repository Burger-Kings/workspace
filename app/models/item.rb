class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  has_one_attached :item_image

  def self.search_for(content)
    Item.where("name LIKE?","%#{content}%")
  end

  def with_tax_price
    (price*1.1).floor
  end

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      item_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end
end
