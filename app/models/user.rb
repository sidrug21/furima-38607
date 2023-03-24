class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英数字での入力が必須
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  # //半角英数字での入力が必須

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :first_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :birthdate, presence: true

  has_many :items
  has_many :purchases
end
