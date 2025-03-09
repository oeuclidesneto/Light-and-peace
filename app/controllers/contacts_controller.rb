class ContactsController < ApplicationController
  def new
    # Renders the contact form
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.contact_email(name, email, message).deliver_now
    redirect_to thank_you_path, notice: "Your message has been sent successfully!"
  end

  def thank_you
    # This renders the thank-you page after form submission
  end

end
