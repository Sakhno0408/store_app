class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product #  ? Нужно ли в Product создавать обратную связь если мы ее не будем использовать?
end
