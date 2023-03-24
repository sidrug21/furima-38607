class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/

  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, allow_blank: true }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/u }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/u }
  validates :birthdate, presence: true

  # has_many :items
  # has_many :purchases
end
