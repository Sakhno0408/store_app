class OrderItemsController < ApplicationController
  layout false

  def create
    order_items.create(item_params)
  end

  private

    def item_params
      params.permit(:product_id, :quantity, :price)
    end
end
