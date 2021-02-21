class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy, :image_sender]

    def index
    end
    
    def company_registration
    end
    
    def create_post_good
        @a = Product.create(id: 7568)
        @productcount = Productcount.find(7568)
        @a.productcount = @productcount
        @productcount.save
        @a.save
        redirect_to root_url
    end
    
  def search
    @products = Product.where('(name LIKE ?  OR name1 LIKE ?) AND real = ?', "%#{params[:q].chomp}%", "%#{params[:q].chomp}%", true)
  end

    def update_slug
        Product.all.each do |e|
            e.slug = Russian.translit(e.name).parameterize
            e.save
        end
        flash[:notice] = 'Слаги успешно обновлены'
        redirect_to admin_root_url
    end
    
    def update_desc
        Product.all.each do |e|
            if (e.description) && (e.description.length > 10)
                e.desc = e.description
                e.save
            end
        end
        flash[:notice] = 'Описания успешно проброшены'
        redirect_to admin_root_url
    end

  def show
    if @product.real == false
      redirect_to _403_url
    end
  end

  def edit
     #Redurect to "restricted area" message
  end

  def destroy
  end

  def update
  end

  def image_sender
    #ActiveStorage::Blob.service.path_for(@product.images[0].key)
    send_file ActiveStorage::Blob.service.path_for(@product.images[0].key), :type => 'image/jpeg', :disposition => 'inline'
  end
  
  def download_price_yml
  send_file(
    "#{Rails.root}/public/price.yml",
    filename: "price.yml",
    type: "application/text"
  )
  end
  
  def place_to_yml(file, file_id, c_name)
        Product.where(category_id: Category.where(cone_name: c_name).first).each do |product|
            if product.productcount.count > 0
            if product.market == true# && product.accia_id == 1)
            if product.main == true
                @all_fas = product.follows.split(';')
                @all_fas.each do |current_product_id|
                    @product = Product.find(current_product_id)
                    if (@product.productcount.count > 0)
                        file.puts '<offer id="'+"#{@product.id}"+'">'
                        file.puts '<name>'+"#{product.name.gsub('&', '&amp;')}"+' '+"#{@product.currentfas}"+'</name>'
                        if @product.brand != ""
                            file.puts '<vendor>'+"#{product.brand}"+'</vendor>'
                        end
                        file.puts '<url>https://jollytail.ru'+"#{product_path(product)}"+"?ids="+"#{@product.id}"+';market=yes</url>'
                        if ( (@product.accia_id == 1) || (Accia.find(@product.accia_id).endtime < Time.now())  ||  (Accia.find(@product.accia_id).promo == false))
                            file.puts '<price>'+"#{@product.price}"+'</price>'
                        else
                            file.puts '<price>'+"#{@product.action_price}"+'</price>'
                            file.puts '<oldprice>'+"#{@product.price}"+'</oldprice>'
                        end
                        file.puts '<currencyId>RUR</currencyId>'
                        file.puts '<categoryId>'+"#{file_id}"+'</categoryId>'
                
                        require 'uri'
                        str = "https://jollytail.ru/image_sender?id="+@product.id.to_s
                        file.puts '<picture>'+"#{str}"+'</picture>'
                        file.puts '<description>'
                        file.puts '<![CDATA['
                        file.puts '<h3>'+"#{product.name}"+'</h3>'
                        if product.market_desc != nil
                            file.puts "#{product.market_desc[0..2900]}"
                        end
                        file.puts ']]>'
                        file.puts '</description>'
                        file.puts '<delivery-options>'
                        if (product.productcount.count > 0)
                            if (@product.price >= 700)
                                file.puts '<option cost="0" days="0" order-before="19"/>'
                            else
                                file.puts '<option cost="150" days="0" order-before="19"/>'
                            end
                        else
                            file.puts '<option cost="150" days=""/>'
                        end
                        file.puts '</delivery-options>'
                        file.puts '<sales_notes>Доставим по Екатеринбургу в день заказа</sales_notes>'
                        file.puts '</offer>'
                    end
                end
            else #Not Main
                file.puts '<offer id="'+"#{product.id}"+'">'
                file.puts '<name>'+"#{product.name.gsub('&', '&amp;')}"+'</name>'
                if product.brand != ""
                    file.puts '<vendor>'+"#{product.brand}"+'</vendor>'
                end
                file.puts '<url>https://jollytail.ru'+"#{product_path(product)}"+'?market=yes</url>'
                if( (product.accia_id == 1) || (Accia.find(@product.accia_id).endtime < Time.now()) ||  (Accia.find(@product.accia_id).promo == false))
                    file.puts '<price>'+"#{product.price}"+'</price>'
                else
                    file.puts '<price>'+"#{product.action_price}"+'</price>'
                    file.puts '<oldprice>'+"#{product.price}"+'</oldprice>'
                end
                file.puts '<currencyId>RUR</currencyId>'
                file.puts '<categoryId>'+"#{file_id}"+'</categoryId>'
                require 'uri'
                str = "https://jollytail.ru/image_sender?id="+product.id.to_s
                file.puts '<picture>'+"#{str}"+'</picture>'
                file.puts '<description>'
                file.puts '<![CDATA['
                file.puts '<h3>'+"#{product.name}"+'</h3>'
                if product.market_desc != nil
                    file.puts "#{product.market_desc[0..2900]}"
                end
                file.puts ']]>'
                file.puts '</description>'
                file.puts '<delivery-options>'
                if (product.price >= 700)    
                    file.puts '<option cost="0" days="0" order-before="19"/>'
                else
                    file.puts '<option cost="150" days="0" order-before="19"/>'
                end
                file.puts '</delivery-options>'
                file.puts '<sales_notes>Доставим по Екатеринбургу в день заказа</sales_notes>'
                file.puts '</offer>'
            end
            end
            end
        end
  end
  
  
  def generate_yml
      
    File.open('public/price.yml', 'w') do |file|
        file.puts '<?xml version="1.0" encoding="utf-8"?>'
        file.puts '<!DOCTYPE yml_catalog SYSTEM "shops.dtd">'
        file.puts '<yml_catalog date="2015-05-11 14:40">'
        file.puts '<shop>'
        file.puts '<name>Зоомагазин JollyTail</name>'
        file.puts '<company>ИП Мартьянова</company>'
        file.puts '<url>https://jollytail.ru</url>'
        file.puts '<phone>+7 (343) 286-85-76</phone>'
        file.puts '<currencies>'
        file.puts '<currency id="RUB" rate="1"/>'
        file.puts '</currencies>'
        file.puts '<categories>'
        file.puts '<category id="1">Товары для животных</category>'
        
        file.puts '<category id="2" parentId="1">Корма для кошек и собак</category>'
        file.puts '<category id="3" parentId="2">Корма для кошек</category>'
        file.puts '<category id="4" parentId="2">Корма для собак</category>'
        
        file.puts '<category id="5" parentId="1">Амуниция для собак</category>'
        file.puts '<category id="6" parentId="5">Намордники и недоузки для собак</category>'
        file.puts '<category id="7" parentId="5">Ошейники для собак</category>'
        file.puts '<category id="8" parentId="5">Поводки для собак</category>'
        #file.puts '<category id="9" parentId="5">Шлейки для собак</category>'
        
        #file.puts '<category id="10" parentId="1">Лакомства для грызунов</category>'
        file.puts '<category id="11" parentId="1">Лакомства для кошек</category>'
        #file.puts '<category id="12" parentId="1">Лакомства для птиц</category>'
        file.puts '<category id="13" parentId="1">Лакомства для собак</category>'
        
        file.puts '<category id="14" parentId="1">Наполнители для кошачьих туалетов</category>'
        file.puts '<category id="15" parentId="1">Игрушки для кошек и собак</category>'
        
        #file.puts '<category id="16" parentId="1">Корма для птиц</category>'
        #file.puts '<category id="17" parentId="1">Корма для грызунов и хорьков</category>'
        
        file.puts '<category id="18" parentId="1">Туалеты и аксессуары для кошек</category>'
        file.puts '<category id="19" parentId="1">Туалеты и аксессуары для собак</category>'
        file.puts '</categories>'
        file.puts '<delivery-options>'
        file.puts '<option cost="150" days="0" order-before="20"/>'
        file.puts '</delivery-options>'
        file.puts '<pickup-options>'
        file.puts '<option cost="0" days="0" order-before="20"/>'
        file.puts '</pickup-options>'
        file.puts '<offers>'
        
        #Корма для кошек
        place_to_yml(file, 3, "Корма для кошек сухие")
        place_to_yml(file, 3, "Корма для кошек влажные")
        place_to_yml(file, 3, "Диеты для кошек")
        #Корма для собак
        place_to_yml(file, 4, "Мясо для собак")
        place_to_yml(file, 4, "Корма для собак сухие")
        place_to_yml(file, 4, "Корма для собак влажные")
        place_to_yml(file, 4, "Диеты для собак")
        #Амуниция для собак
        place_to_yml(file, 6, "Намордники")
        place_to_yml(file, 7, "Ошейники")
        #place_to_yml(file, 8, "Поводки, ринговки")
        place_to_yml(file, 8, "Рулетки для животных")
        #place_to_yml(file, 9, "Шлейки")
        #Лакомства
        #place_to_yml(file, 10, "Лакомства для грызунов")
        place_to_yml(file, 11, "Лакомства для кошек")
        #place_to_yml(file, 12, "Лакомства для птиц")
        place_to_yml(file, 13, "Лакомства для собак")
        #Наполнители
        place_to_yml(file, 14, "Древесные наполнители")
        place_to_yml(file, 14, "Силикагелевые наполнители")
        place_to_yml(file, 14, "Комкующиеся")
        place_to_yml(file, 14, "Минеральные впитывающие")
        place_to_yml(file, 14, "Древесные комкующиеся")
        #Игрушки для кошек и собак
        place_to_yml(file, 15, "Игрушки для кошек")
        place_to_yml(file, 15, "Мячи, мячики")
        place_to_yml(file, 15, "Мягкие игрушки")
        place_to_yml(file, 15, "Резина, латекс, каучук")

        #place_to_yml(file, 16, "Корма для птиц")
        #place_to_yml(file, 17, "Корма для грызунов")
        
        place_to_yml(file, 18, "Лотки, совки")
        place_to_yml(file, 19, "Пеленки и подгузники для животных")
        
        file.puts '</offers>'
        file.puts '</shop>'
        file.puts '</yml_catalog>'
    end
      
      
    flash[:notice] = 'YML файл успешно сгенерирован.'
    redirect_to admin_root_url
  end
  
  
      
  def update_all
    ##Определение исходных
    xlsx = Roo::Spreadsheet.open(ActiveStorage::Blob.service.path_for(Pricelist.first.image.key), :extension => "xlsx")
    #xlsx = Roo::Spreadsheet.open 'price_list.xlsx' Old version
    @place = xlsx.sheet(0)
    @i = 1; #строка
    @j = 4; #столбец
    @work_cell = @place.cell(@i, @j) ? @place.cell(@i, @j) : ""
    
    ## Определение длины файла
    @zero = 0
    while @i < 90000 do
        @i = @i + 1
        @work_cell = @place.cell(@i, @j) ? @place.cell(@i, @j) : ""
        if(@work_cell == "")
            @zero = @zero + 1
        else
            @zero = 0
        end
        if @zero == 10
            break
        end
    end
    @length = @i
    
    ## Восстановление исходных
    xlsx = Roo::Spreadsheet.open(ActiveStorage::Blob.service.path_for(Pricelist.first.image.key), :extension => "xlsx")
    @place = xlsx.sheet(0)
    @i = 1; #строка
    @j = 4; #столбец
    @work_cell = @place.cell(@i, @j) ? @place.cell(@i, @j) : ""
    
    ## Цикл загрузки
while @i < @length do
  # Рабочая ячейка:
  @work_cell = @place.cell(@i, @j) ? @place.cell(@i, @j) : ""
  # Если в ячейке товар:
  if @work_cell.include?("НФ-")
    #Проверка на первый товар в категории, или пропуск:
    if @place.cell(@i-1, 2) ## Первый товар в категории
      @cat_name = @place.cell(@i-1, 2) ## Берем новое имя категории
      ## Проверка исключений:
      if ( (@cat_name == "Диеты для собак сухие") || (@cat_name == "Диеты для собак влажные") )
          @cat_name = "Диеты для собак"
      end
      if ( (@cat_name == "Диеты для кошек сухие") || (@cat_name == "Диеты для кошек влажные") )
          @cat_name = "Диеты для кошек"
      end
      ## Проверка на существование такой категории:
      if Category.exists?(cone_name: @cat_name)## Если существует:
        @current_cat = Category.where(cone_name: @cat_name).first
      else ## Если нет:
        @current_cat = "skip"
      end
      #Загружаем товар:
      if @current_cat == "skip" ## Если категория мертвая:
        @i = @i + 1
      else ## Если категория живая:
        @work_cell = @work_cell[3, 10] #Вычленяем id товара
        if Product.exists?(@work_cell) #Если товар есть в базе
          @product = Product.find(@work_cell)
          @product.price = @place.cell(@i, 17) ? @place.cell(@i, 17).to_f : 0
          @product.slug = Russian.translit(@product.name).parameterize
          
          if(Productcount.exists?(@product.id))
            @product.productcount.count = @place.cell(@i, 15) ? @place.cell(@i, 15) : 0
          else
            @productcount = Productcount.new(id: @work_cell, count: (@place.cell(@i, 15) ? @place.cell(@i, 15) : 0))
            @product.productcount = @productcount
          end
          @product.save
          @product.productcount.save
        else #Если товара нет в базе
          @product = Product.new(id: @work_cell,
                                 name: @place.cell(@i, 8)[0, 52],
                                 price: @place.cell(@i, 17) ? @place.cell(@i, 17).to_f : 0,
                                 category_id: (@current_cat.id),
                                 accia_id: 1,
                                 real: false)
          if(Productcount.exists?(@work_cell))
            Productcount.find(@work_cell).delete
            @productcount = Productcount.new(id: @work_cell, count: @place.cell(@i, 15) ? @place.cell(@i, 15) : 0)      
            @product.productcount = @productcount
          else
            @productcount = Productcount.new(id: @work_cell, count: @place.cell(@i, 15) ? @place.cell(@i, 15) : 0)    
            @product.productcount = @productcount
          end
          @product.slug = Russian.translit(@product.name).parameterize
          @product.save
          @productcount.save
        end
        @i = @i + 1
      end
    else ## Если товар не первый:
      #Загружаем товар:
      if @current_cat == "skip" ## Если категория мертвая:
        @i = @i + 1
      else ## Если категория живая:
        @work_cell = @work_cell[3, 10] #Вычленяем id товара
        if Product.exists?(@work_cell) #Если товар есть в базе
          @product = Product.find(@work_cell)
          @product.price = @place.cell(@i, 17) ? @place.cell(@i, 17).to_f : 0
          @product.slug = Russian.translit(@product.name).parameterize
          
          if(Productcount.exists?(@product.id))
            @product.productcount.count = @place.cell(@i, 15) ? @place.cell(@i, 15) : 0
          else
            @productcount = Productcount.new(id: @work_cell, count: (@place.cell(@i, 15) ? @place.cell(@i, 15) : 0))
            @product.productcount = @productcount
          end
          @product.save
          @product.productcount.save
        else #Если товара нет в базе
          @product = Product.new(id: @work_cell,
                                 name: @place.cell(@i, 8)[0, 52],
                                 price: @place.cell(@i, 17) ? @place.cell(@i, 17).to_f : 0,
                                 category_id: (@current_cat.id),
                                 accia_id: 1,
                                 real: false)
          if(Productcount.exists?(@work_cell))
            Productcount.find(@work_cell).delete
            @productcount = Productcount.new(id: @work_cell, count: @place.cell(@i, 15) ? @place.cell(@i, 15) : 0)      
            @product.productcount = @productcount
          else
            @productcount = Productcount.new(id: @work_cell, count: @place.cell(@i, 15) ? @place.cell(@i, 15) : 0)    
            @product.productcount = @productcount
          end
          @product.slug = Russian.translit(@product.name).parameterize
          @product.save
          @productcount.save
        end
        @i = @i + 1
      end      
    end
  else ## Если в ячейке не товар:
    @i = @i + 1
  end
end
    flash[:notice] = 'База успешно обновлена'
    redirect_to admin_root_url
  end

  def product_params
    params.require(:product).permit(:id, :name, :images, :description, :name1, :action_price, :real, :desc, :main, :follows, :currentfas, :market, :market_desc, :analoges, :addingsales)
  end

  def productcount_params
    params.require(:productcount).permit(:id, :count)
  end
  
  def category_params
    params.require(:category).permit(:id, :name, :cone_name)
  end
  
  def pricelist_params
    params.require(:pricelist).permit(:id, :image)
  end
  

  def find_product
    if Product.exists?(params[:id])
      @product = Product.find(params[:id])
    else
      redirect_to _403_url
    end
  end

end
