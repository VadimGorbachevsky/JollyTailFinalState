class CartsController < ApplicationController

  before_action :find_cart, only: [:edit, :show, :update, :destroy]

  def index
    
  end

  def show

  end

  def new
  end

  def edit

  end

  def destroy
  end

  def update

  end

  def cart_params
    params.require(:cart).permit(:id, :user_id, :product_ids)
  end

  def position_params
    params.require(:position).permit(:id, :cart_id, :product_id, :quantity)
  end

  def product_params
    params.require(:product).permit(:id, :name, :image)
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end

end
