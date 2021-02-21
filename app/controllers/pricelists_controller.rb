class PricelistsController < ApplicationController
  def pricelist_params
    params.require(:pricelist).permit(:id, :image)
  end
end