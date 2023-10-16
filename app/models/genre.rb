class Genre < ApplicationRecord
  # dependent: :destroyつけるか付けないか要検討
  has_many :items
end
