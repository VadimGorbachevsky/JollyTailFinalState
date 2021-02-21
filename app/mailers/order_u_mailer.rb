class OrderUMailer < ApplicationMailer

  default from: 'info@jollytail.ru'
  layout 'mailer'

  def you_order_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Ваш Заказ')
  end

end
