class UnorderUsMailer < ApplicationMailer

  default from: 'info@jollytail.ru'
  layout 'mailer'

  def unorder_us_mailer
    mail(to: "info@jollytail.ru", subject: "Заявка")
  end

end
