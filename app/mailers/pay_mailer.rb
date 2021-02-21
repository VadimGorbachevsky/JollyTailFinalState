class PayMailer < ApplicationMailer

  default from: 'info@jollytail.ru'
  layout 'mailer'

  def pay_mailer
    mail(to: "info@jollytail.ru", subject: "Оплата картой")
  end

end
