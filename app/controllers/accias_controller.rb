class AcciasController < ApplicationController

  before_action :find_accia, only: [:edit, :show, :update, :destroy]




  def index
    @accias = Accia.where("real = :real and id > :id", { real: true, id: 1 })
  end

  def show
    @products = Product.where("accia_id = :id and real = :real", { id: @accia.id, real: true })
  end

  def new
  end

  def edit

  end

  def destroy
  end

  def update

  end

  def accia_params
    params.require(:accia).permit(:id, :name, :real, :description)
  end

  def product_params
    params.require(:product).permit(:id, :accia_id, :real, :promo)
  end

  def find_accia
    @accia = Accia.find(params[:id])
  end

  def after_initialize
    self.start_time ||= Time.now
  end

end
