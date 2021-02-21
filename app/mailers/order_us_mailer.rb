class OrderUsMailer < ApplicationMailer

  default from: 'info@jollytail.ru'
  layout 'mailer'

  def us_order_email
    @user = params[:user]
    @order = params[:order]
    @phone = params[:phone]
    @delivery_method = params[:delivery_method]
    params[:extraction_point] ? @extraction_point = params[:extraction_point] : @extraction_point = ''
    @pay_method = params[:pay_method] ? params[:pay_method] : ''
    mail(to: "info@jollytail.ru", subject: "Заказ № #{@order.id}")
  end

end
