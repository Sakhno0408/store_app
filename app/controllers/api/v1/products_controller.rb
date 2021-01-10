class Api::V1::ProductsController < Api::V1::BaseController

  skip_before_action :doorkeeper_authorize!, on: :index

  def index
    @products = Product.all.limit(5)
    respound_with @products
  end
end
