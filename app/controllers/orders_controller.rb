class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def exterminatus
      Order.where(phone: '').each do |s|
        s.delete
      end
      flash[:notice] = 'Пустые заказы успешно удалены'
      redirect_to admin_root_url
  end
  
  def card
      @order = Order.where(user_id: current_user.id).order('created_at DESC').first
      OrderUsMailer.with(user: current_user, order: @order, pay_method: @order.pay_method, delivery_method: @order.delivery, phone:  @order.phone, extraction_point: @extraction_point).us_order_email.deliver_now
      flash[:notice] = "Ваш заказ №#{@order.id} поступил в обработку"
        if current_user.email.include? "testernonexistmailer"
            @order.user_id = 57
            @order.save
            current_user.cart.delete
            current_user.delete
            text = ["Заказ № #{@order.id} поступил в обработку.", "В ближайшее время менеджер свяжется с вами для уточнения деталей.", "Для доступа к истории ваших заказов рекомендуем зарегистрироваться."]
            flash[:notice] = text
            redirect_to root_url
        else
            text = ["Заказ № #{@order.id} поступил в обработку.", "В ближайшее время менеджер свяжется с вами для уточнения деталей.", "Спасибо, что выбрали нас)"]
            flash[:notice] = text
            OrderUMailer.with(user: current_user).you_order_email.deliver_now
            redirect_to user_url(current_user)
        end
  end

  def card_step
  end


  def create
    require "net/http"

    @adress = params[:adr] ? params[:adr] : ''
    @pay_method = params[:pay_method]
    @delivery_method = params[:delivery_method]
    @phone =  params[:phone]
    params[:bonus] ? @bonus = params[:bonus] : @bonus = ''
    params[:extraction_point] ? @extraction_point = params[:extraction_point] : @extraction_point = ''
    
    if @delivery_method == '4' 
        current_user.cart.positions.create(cart: @new_cart, product_id: 65000, quantity: 1, order_id: 29)
    end
    
    @all_price = 0
    current_user.cart.positions.each do |pos| #SUM
        @product = Product.find(pos.product_id)
        
        if ( (@product.accia_id == 1) || (Accia.find(@product.accia_id).endtime < Time.now()) )
            @all_price = @all_price + @product.price * pos.quantity
        else
            @all_price = @all_price + @product.action_price * pos.quantity
        end
    end
    
    if ( (@delivery_method == '2') && (@all_price < 700) )
        current_user.cart.positions.create(cart: @new_cart, product_id: 65001, quantity: 1, order_id: 29)
        @all_price = @all_price + 150
    end
    
    
    @order = Order.create(id: Order.all.last.id+1, user_id: current_user.id)
    
    if @pay_method == '1'  #CREATE LINK TO PAYMENT
        @payment =   {
            "amount" => {
                        "value" => @all_price, 
                        'currency' => 'RUB'
                        },
            "description"=> @order.id,
            "payment_method_data" => {
                                      "type" => 'bank_card'
                                      },
            "confirmation" => {
                                'type' => 'redirect',
                                'return_url' => 'https://jollytail.ru/card'
                              },
            "capture" => true
                    }
      header = {'Idempotence-Key': SecureRandom.uuid,'Content-Type': 'application/json'}
      uri = URI.parse("https://payment.yandex.net/api/v3/payments")
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @request = Net::HTTP::Post.new(uri.request_uri, header)
      @request.basic_auth '608127', 'live_mq2QOrWI6qpG0wkE0b6-dH6Jc4_iD9MGJC-5BhZVc_I'
      @request.body = @payment.to_json
      @response = @http.request(@request)
      @link = JSON.parse(@response.body)["confirmation"]["confirmation_url"]
    end
        
    
    
    
    @order.positions = current_user.cart.positions
    @order.adress = params[:adr] ? params[:adr] : ''
    @order.phone = @phone
    @order.card = @bonus
    @order.link = @link ? @link : ''
    @order.pay_method = @pay_method
    @order.delivery =  @delivery_method
    @order.save
    
    current_user.cart.positions = []

    if @link 
        if params[:ad]
            i = 1
        else
            PayMailer.pay_mailer.deliver_now
            redirect_to @link
        end
    else
        OrderUsMailer.with(user: current_user, order: @order, pay_method: @pay_method, delivery_method: @delivery_method, phone: @phone, extraction_point: @extraction_point).us_order_email.deliver_now
        flash[:notice] = "Ваш заказ №#{@order.id} поступил в обработку"
        if current_user.email.include? "testernonexistmailer"
            @order.user_id = 57
            @order.save
            current_user.cart.delete
            current_user.delete
            text = ["Заказ № #{@order.id} поступил в обработку.", "В ближайшее время менеджер свяжется с вами для уточнения деталей.", "Для доступа к истории ваших заказов рекомендуем зарегистрироваться."]
            flash[:notice] = text
            redirect_to root_url
        else
            text = ["Заказ № #{@order.id} поступил в обработку.", "В ближайшее время менеджер свяжется с вами для уточнения деталей.", "Спасибо, что выбрали нас)"]
            flash[:notice] = text
            OrderUMailer.with(user: current_user).you_order_email.deliver_now
            redirect_to user_url(current_user)
        end
    end
    
  end
  
  def step
  end


  def edit
     #Redurect to "restricted area" message
  end

  def destroy
  end

  def update
  end

  def decrease_counts
  end

  def order_params
    params.require(:order).permit(:id, :user_id, :phone, :adress, :link, :delivery, :pay_method, :card)
  end

  def productcount_params
    params.require(:productcount).permit(:id, :count, :product_id, :ordercount)
  end
  
  def position_params
    params.require(:position).permit(:id, :quantity, :product_id, :cart_id, :order_id)
  end

  def cart_params
    params.require(:cart).permit(:id, :positions)
  end
  
  def product_params
    params.require(:product).permit(:id, :name, :price, :accia_id, :action_price)
  end

  def user_params
    params.require(:user).permit(:id, :cart_id, :name, :email)
  end

  def find_order
    @product = Product.find(params[:id])
  end

end
