class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name = name
    @message = message
    @email = email
    mail(subject: "New Contact Form Message")
  end
end
