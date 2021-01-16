class OrdersController < ApplicationController
  include CartsHelper

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new

     @order = current_user.orders.new

     @delivery_methods = DeliveryMethod.all
  end

  def create
    @order = current_user.orders.new(order_params)



    if @order.save
      products.map do |item|
        @order.order_items.create(product_id: item.product_id, quantity: item.quantity, price: item.product.price);
      end
      redirect_to @order
    else
      render 'new'
    end
  end

  # def set_page_options
  #   set_meta_tags product.slice(:title, :keywords, :description)
  #   add_breadcrumb 'Home', root_path, title: 'Home'
  # end

  private
    def order_params
      params.require(:order).permit(:address, :credit_card, :delivery_method_id)
    end

    helper_method :products
end
