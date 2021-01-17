class OrdersController < ApplicationController
  include CartsHelper
  before_action :set_page_options

  def show
    @order = current_user.orders.find(params[:id])
    @delivery_methods = DeliveryMethod.find(@order.delivery_method_id)
  end

  def new
     @order = current_user.orders.new
     @delivery_methods = DeliveryMethod.all
     products.map do |item|
       @order.order_items.new(product_id: item.product_id, quantity: item.quantity, price: item.product.price);
     end
  end

  def create
    @order = current_user.orders.new(order_params)
    params[:order][:order_items].map do |item|
      @order.order_items.new(product_id: item[:product_id], quantity: item[:quantity], price: item[:price]);
    end

    if @order.save
      redirect_to @order
    else
      @delivery_methods = DeliveryMethod.all
      render 'new'
    end
  end

  def set_page_options
    set_meta_tags title: 'Create Order'
    add_breadcrumb 'Home', root_path, title: 'Home'
  end

  private
    def order_params
      params.require(:order).permit(:address, :credit_card, :delivery_method_id)
    end

    helper_method :products
end
