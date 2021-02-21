class PoliticController < ApplicationController

  def index
  end
  
  def sitemap
    respond_to do |format|
        format.xml { render file: 'public/sitemaps/sitemap.xml' }
        format.html { redirect_to root_url }
    end
  end
  
  def robots
  end
  
  def new_root
  end
  
  def clothes
  end

  def credits
  end

  def delivery
  end
  
  def reget
  end
  


end
