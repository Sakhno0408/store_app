class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :delivery_methods
  has_many :products, through: :order_items
  belongs_to :user
end