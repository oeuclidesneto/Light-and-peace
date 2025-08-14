class ApplicationMailer < ActionMailer::Base
  default from: -> {
    email = ENV.fetch("MAILER_SENDER", "contact@lightandpeacespiritism.org")
    %("Light & Peace Website" <#{email}>)
  }
  layout "mailer"
end
