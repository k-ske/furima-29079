class Product < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :content
    validates :category_id
    validates :status_id
    validates :ship_cost_id
    validates :prefecture_id
    validates :day_to_get_id
    validates :price
    validates :user
    validates :image
end
