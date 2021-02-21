class CategoriesController < ApplicationController

  before_action :find_category, only: [:show, :edit, :update, :destroy, :image_cat_sender]

  def index
    @max_products_count = 15
    @page_number = params[:page_number] ? params[:page_number].to_i : 1
    @categories = Category.all
    @all_products = Product.where(real: true).joins(:productcount).order('productcounts.count desc')
    
    @max_page_number = (@all_products.size.divmod(@max_products_count)[1] == 0) ? @all_products.size.divmod(@max_products_count)[0] : @all_products.size.divmod(@max_products_count)[0]+1
    @products = @all_products[(@page_number-1)*@max_products_count, @max_products_count]
  end
  
  def adding
    if ( (params[:page_number].to_i+1) <= params[:max_page_number].to_i )
        @page_number = params[:page_number].to_i + 1
        @max_page_number = params[:max_page_number].to_i
        @max_products_count = params[:max_products_count].to_i
        @all_products = Product.where(real: true).joins(:productcount).order('productcounts.ordercount desc')
        @products = @all_products[(@page_number - 1)*@max_products_count, @max_products_count]
    end
  end
  
  def image_cat_sender
    #ActiveStorage::Blob.service.path_for(@product.images[0].key)
    send_file ActiveStorage::Blob.service.path_for(@category.image.key), :type => 'image/jpeg', :disposition => 'inline'
  end
  
  def pagination
    render partial: 'partials/posts', layout: false, locals: { categories: get_posts }
  end
  
  
  #items/1 GET
  def show
    @max_products_count = 24
    @page_number = params[:page_number] ? params[:page_number].to_i : 1
    
    @products = Product.where(real: true, category_id: @category.subtree_ids)
    
    if params[:brand]
        @hj = []
        @products.each do |d|
            if d.brand == params[:brand]
                @hj.push(d)
            end
        end
        @products = @hj
    else
        @products2 = []
        @products3 = []
        i = 0
        @products.each do |s|
            if (s.productcount.count == 0)
                @products3.push(s)
            elsif ((s.brand == "Royal Canin") && (i < 10))
                @products2.push(s)
                i = i + 1
            end
        end
        @products = (@products3 | @products).reverse
        @products = @products2 | @products
    end
    
    if params[:sort]
        if params[:sort] == "По возрастанию"
            @products = @products.order('price asc')
        end
        if params[:sort] == "По убыванию"
            @products = @products.order('price desc')
        end
    end
    
    @max_page_number = (@products.size.divmod(@max_products_count)[1] == 0) ? @products.size.divmod(@max_products_count)[0] : @products.size.divmod(@max_products_count)[0]+1
    @products = @products[(@page_number-1)*@max_products_count, @max_products_count]
  end
  
  #items/1 GET
  def new
  end

  #items/1 GET
  def edit
  end

  #items POST
  def create
    @category = Category.create(category_params)
  end

  #items/1 PUT
  def update
    @category.slug = Russian.translit(@category.name).parameterize
    @category.update_attributes(category_params)
  end

  #items/1 DELETE
  def destroy
    @category.destroy
  end

  def category_params
    params.require(:сategory).permit(:name, :admin_name, :ancestry, :url, :real, :flags, :slug, :cone_name, :text_1, :text_2, :image)
  end

  def product_params
    params.require(:product).permit(:name, :slug)
  end

  def productcount_params
    params.require(:productcount).permit(:id, :ordercount)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
