class PositionsController < ApplicationController

  before_action :find_position, only: [:show, :edit, :update, :destroy]

  def index
  end

    def new
        Position.create(cart_id: current_user.cart_id, product_id: params[:prod_id], quantity: params[:quantity], order_id: 29)
        respond_to do |format|
            format.js
        end
    end
  def create
        Position.create(cart_id: current_user.cart_id, product_id: params[:position][:prod_id], quantity: params[:position][:quantity], order_id: 29)

      respond_to do |format|
        format.js
      end
  end


  def show
  end

  def edit
     #Redurect to "restricted area" message
  end

  def destroy
    @position.delete
    redirect_to user_path(current_user, :param1 => "start")
  end

  def update
  end


  def position_params
    params.require(:position).permit(:id, :cart_id, :order_id, :quantity)
  end
  
  def order_params
    params.require(:order).permit(:id, :phone, :user_id)
  end
  
  def product_params
    params.require(:product).permit(:id, :name, :price, :accia_id, :action_price)
  end

  def find_position
    @position = Position.find(params[:id])
  end

end
