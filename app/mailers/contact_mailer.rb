class ContactMailer < ApplicationMailer
  default to: "euclidesneto777@gmail.com", from: "noreply@lightandpeace.com"

  def contact_email(name, email, message)
    @name = name
    @message = message
    @email = email

    mail(subject: "Solicitação de Contato - Light & Peace")
  end
end
