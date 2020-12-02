class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :tel_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be --" }
    validates :city
    validates :house_number
    validates :tel_number, format: { with: /\A[0-9]+\z/, message: 'input only half-width number' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Ship.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, tel_number: tel_number, purchase_id: purchase.id)
  end
end
