class Product < ApplicationRecord
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
end
