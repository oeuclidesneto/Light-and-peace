class PagesController < ApplicationController


  def home
    @next_speech = Speech.where("date >= ?", Time.now).order(:date).first
  end
    def about
  end

  def contact
    if request.post?
      # You can either save the form data to the database or send an email
      name = params[:name]
      email = params[:email]
      message = params[:message]

      ContactMailer.contact_email(name, email, message).deliver_now

      # Example: Send email using ActionMailer (assuming you have a Mailer set up)
      # ContactMailer.contact_email(name, email, message).deliver_now

      flash[:notice] = "Thank you for contacting us. We'll get back to you soon."
      redirect_to contact_path
    end
  end

  def schedule
  end

end
