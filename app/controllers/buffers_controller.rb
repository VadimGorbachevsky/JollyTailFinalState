class BuffersController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def buffer_params
    params.require(:buffer).permit(:id, :image)
  end
  
  def product_params
    params.require(:product).permit(:id, :image)
  end

end
