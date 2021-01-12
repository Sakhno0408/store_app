class OrdersController < ApplicationController

  # def show
  #
  # end

  def new
     @order = current_user.orders.new
     @delivery_methods = DeliveryMethod.all
  end

  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to 'show'
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
      params.require(:order).permit(:adress, :credit_card, :delivery_method_id)
    end
end
