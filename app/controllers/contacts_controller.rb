class ContactsController < ApplicationController
  def new
    # Renders the contact form (no Contact model needed)
  end

  def create
    # Get the form values
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Check if any field is blank
    if name.blank? || email.blank? || message.blank?
      flash[:alert] = "Please make sure all fields are filled out."
      # Re-render the contact form with the data the user entered
      render :new
    else
      # Send the email if all fields are filled
      ContactMailer.contact_email(name, email, message).deliver_now
      flash[:notice] = "Your message has been sent successfully!"
      redirect_to thank_you_path
    end
  end

  def thank_you
    # This renders the thank-you page after form submission
  end
end
