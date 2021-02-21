class RegistrationsController < Devise::RegistrationsController

  def after_inactive_sign_up_path_for (resource)
    @cart = Cart.new
    @cart.user_id = resource.id
    @cart.save
    resource.name = "Пользователь"
    resource.referal_code = params[:user][:referal_code] ? params[:user][:referal_code] : "none"
    resource.cart_id = @cart.id
    resource.save
    root_url
  end
  
  def company_registration(resource)

  end

end
