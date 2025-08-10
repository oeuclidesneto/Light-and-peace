class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_SENDER", "euclidesneto777@gmail.com")
  layout "mailer"
end
