class StartpageController < ApplicationController

  def index
    @accias = Accia.where("real = :real and id > :id", { real: true, id: 1 })
    @c = Category.find(1)
    @c.real = true
    @c.save
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :cart_id, :slug)
  end

  def product_params
    params.require(:product).permit(:id, :name, :slug)
  end

  def assia_params
    params.require(:assia).permit(:id, :name, :image, :real)
  end

  def category_params
    params.require(:category).permit(:id, :name, :slug)
  end



end
