class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name    = name
    @message = message
    @sender_email = email

    mail(
      to: ENV.fetch("CONTACT_RECIPIENT", "contact@lightandpeacespiritism.org"),
      subject: "New contact from #{name} — Light & Peace",
      reply_to: email
    )
  end
end
