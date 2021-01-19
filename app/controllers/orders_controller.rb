class OrdersController < ApplicationController
  include CartsHelper
  before_action :set_page_options

  def index
    @orders = current_user.orders.all
  end


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
     @order.number_order = next_number_order
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.status = "В обработке"
    params[:order][:order_items].map do |item|
      @order.order_items.new(product_id: item[:product_id], quantity: item[:quantity], price: item[:price]);
    end

    if @order.save
      current_cart.destroy

      # puts '~'*100
      # UserMailer.with(user: current_user, order: @order).сonfirmation_email.deliver_now
      # puts '~'*100
      
      redirect_to @order
    else
      @delivery_methods = DeliveryMethod.all
      render 'new'
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id]).destroy
  end

  def set_page_options
    set_meta_tags title: 'Create Order'
    add_breadcrumb 'Главная', root_path, title: 'Главня'
    add_breadcrumb 'Список заказов', orders_path, title: 'Список заказов'
  end

  private
    def next_number_order
      @number = current_user.orders.order(:number_order).last
      if @number
        return @number.number_order+1
      else
        return 1

      end
    end

    def order_params
      params.require(:order).permit(:address, :credit_card, :delivery_method_id, :number_order)
    end

    def order_params_destroy
      params.require(:order).permit(:id)
    end

    helper_method :products
end
