class ItemsController < ApplicationController
  include CartsHelper
  layout false


  def create
    cart_items.create(item_params)
  end

  def update
    puts params
    puts "@" * 100

    @item = cart_items.find_by(item_params_update_or_destroy)
    @item.update(item_params_update)
    render :create
  end


  def destroy
    cart_items.find_by(item_params_update_or_destroy).destroy
    render :create
  end

  private

    def item_params
      params.permit(:product_id, :quantity)
    end

    def item_params_update_or_destroy
      params.permit(:id)
    end

    def item_params_update
      params.permit(:quantity)
    end

    helper_method :products
end
