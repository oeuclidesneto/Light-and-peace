class PagesController < ApplicationController
  def home
    adelaide_time = Time.current.in_time_zone('Adelaide')
    cutoff_time = adelaide_time.change(hour: 20) # 8PM Adelaide time
    today_start = adelaide_time.beginning_of_day

    @next_speech = Speech
                  .where("date >= ?", adelaide_time < cutoff_time ? today_start : cutoff_time)
                  .order(:date)
                  .first
  end

  def about
  end

  def contact
    if request.post?
      name = params[:name]
      email = params[:email]
      message = params[:message]

      ContactMailer.contact_email(name, email, message).deliver_now

      flash[:notice] = "Thank you for contacting us. We'll get back to you soon."
      redirect_to contact_path
    end
  end

  def schedule
  end
end
