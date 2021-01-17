class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_one :delivery_methods
  has_many :products, through: :order_items
  belongs_to :user

  # validates :address, :credit_card, presence: true
  # validates :credit_card, numericality: true
  #
  #
  # validates :credit_card, length: { minimum: 5 }
  # validates :credit_card, length: { is: 16 }


end
