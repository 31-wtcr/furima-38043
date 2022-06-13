class Item < ApplicationRecord
  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :explanation,      presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship
end
