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
    validates :name
    validates :content
    validates :price
    validates :image
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :ship_cost_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :day_to_get_id, numericality: { other_than: 1 } 
  end

end
