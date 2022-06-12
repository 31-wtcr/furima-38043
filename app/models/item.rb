class Item < ApplicationRecord

  validates :item_name,        presence: true
  validates :explanation,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id,    presence: true
  validates :days_to_ship_id,  presence: true
  validates :price,            presence: true

  belongs_to :user
  has_one    :purchase
end
