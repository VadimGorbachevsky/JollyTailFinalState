class SpeedOrderUsMailer < ApplicationMailer

  default from: 'info@jollytail.ru'
  layout 'mailer'

  def speed_order_us_mailer
    @product_name = params[:product_name]
    @phone = params[:phone]
    @current_fas = params[:fas]
    mail(to: "info@jollytail.ru", subject: "Быстрый заказ")
  end

end
