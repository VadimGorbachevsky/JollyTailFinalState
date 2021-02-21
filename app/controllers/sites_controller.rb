class SitessController < ApplicationController

  before_action :find_site, only: [:edit, :show, :update, :destroy]

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

  def site_params
    params.require(:site).permit(:id, :delivery, :slug)
  end

  def find_site
    @site = Site.find(params[:id])
  end

end
