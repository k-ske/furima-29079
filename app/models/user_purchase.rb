class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :tel_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be --" } 
    validates :city
    validates :house_number
    validates :tel_number
  end
  validates :building

  def save
    Purchase.create(user_id: user_id, product_id: product_id)
    Ships.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, tel_number: tel_number, purchase_id: purchase_id)
end