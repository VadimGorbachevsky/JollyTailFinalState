class SpeedOrdersController < ApplicationController

  def index
    
  end

  def show

  end

  def new
  end
  
  def create
    if params[:speed_order][:cart_id]
      @speed_order = Speed_order.new(:id =>Speed_order.all.last.id+1, :product_id => params[:speed_order][:cart_id], :phone => "!Корзина! "+params[:speed_order][:phone])
      @speed_order.save
      @current_fas = "Корзина"
      SpeedOrderUsMailer.with(product_name: @speed_order.product_id, fas: @current_fas, phone: @speed_order.phone).speed_order_us_mailer.deliver_now 
    else
      @speed_order = Speed_order.new(:id =>Speed_order.all.last.id+1, :product_id => params[:speed_order][:product_id], :phone => params[:speed_order][:phone])
      @speed_order.save
      @current_fas = Product.find(@speed_order.product_id).currentfas ? Product.find(@speed_order.product_id).currentfas : "Cтандарт"
      SpeedOrderUsMailer.with(product_name: Product.find(@speed_order.product_id).name, fas: @current_fas, phone: @speed_order.phone).speed_order_us_mailer.deliver_now
    end
  end

  def edit

  end

  def destroy
  end

  def update

  end

  def product_params
    params.require(:product).permit(:id, :name, :currentfas)
  end
  
  def speed_order_params
    params.require(:speed_order).permit(:id, :product_id, :phone)
  end


end
