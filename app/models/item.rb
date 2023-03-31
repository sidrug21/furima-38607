class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, inclusion: { in: 2..11 }
  validates :condition_id, presence: true, inclusion: { in: 2..7 }
  validates :shipping_fee_burden_id, presence: true, inclusion: { in: 2..3 }
  validates :prefecture_id, presence: true, inclusion: { in: 2..48 }
  validates :shipping_duration_id, presence: true, inclusion: { in: 2..4 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image
  has_one :purchase
  # belongs_to_active_hash :shipping_address, class_name: 'Prefecture'
  belongs_to :condition
  belongs_to :shipping_duration
  belongs_to :shipping_fee_burden
  belongs_to :category
end
