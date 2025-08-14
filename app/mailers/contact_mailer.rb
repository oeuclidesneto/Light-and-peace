# app/mailers/contact_mailer.rb
class ContactMailer < ApplicationMailer
  default from: ENV.fetch("MAILER_SENDER", "contact@lightandpeacespiritism.org")

  def contact_email(name, email, message)
    @name = name
    @message = message

    mail(
      to: ENV.fetch("CONTACT_RECIPIENT", "contact@lightandpeacespiritism.org"),
      subject: "Solicitação de Contato - Light & Peace",
      reply_to: email
    )
  end
end
