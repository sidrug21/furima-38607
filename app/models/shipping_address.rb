class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  # include ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture
  # has_one :item, through: :purchase
end
