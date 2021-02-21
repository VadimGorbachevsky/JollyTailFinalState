class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end
  
    def first_guest_taken
    @name = "guest" + (User.last.id + 1).to_s
    @email = "guest" + (User.last.id + 1).to_s + "@testernonexistmailer.ru"
    @user = User.new(email: @email, password: "password", password_confirmation: "password")
    @user.name = "Гость"
    @user.skip_confirmation!
    @user.save
    @cart = Cart.new
    @cart.user_id = @user.id
    @cart.save
    @user.cart_id = @cart.id
    @user.save
    warden.set_user @user
    Position.create(cart_id: current_user.cart_id, product_id: params[:user][:prod_id], quantity: params[:user][:quantity], order_id: 29)
    #redirect_to new_position_url, prod_id: params[:user][:prod_id], quantity: params[:user][:quantity]
    redirect_back(fallback_location:"/")
  end

  def show
    @cart = Cart.find(@user.cart_id)
  end

  def edit
  end

  def destroy
  end
  
  def company_registration
  end

  def update
    @user.update(name: params[:user][:name], email: params[:user][:email],  city: params[:user][:city],  telephone: params[:user][:telephone])
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :cart_id, :slug, :telephone, :city, :role, :referal_code)
  end

  def cart_params
    params.require(:cart).permit(:id, :user_id, :slug)
  end

  def position_params
    params.require(:position).permit(:id, :product_id, :quantity)
  end

  def product_params
    params.require(:product).permit(:id, :name, :slug)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
