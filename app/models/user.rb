class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must have @" }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :birthday, presence: true
end
