class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_to_get

  has_one_attached :image
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting" }
    validates :image
    validates :category_id, numericality: { other_than: 1, message: "can't be --" } 
    validates :status_id, numericality: { other_than: 1, message: "can't be --" } 
    validates :ship_cost_id, numericality: { other_than: 1, message: "can't be --" } 
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be --" } 
    validates :day_to_get_id, numericality: { other_than: 1, message: "can't be --" } 
  end

end
