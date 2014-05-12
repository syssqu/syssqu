class SendMailer < ActionMailer::Base
  default from: "njsekay@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mailer.send_entry.subject
  #
  def send_entry(info)
    @info = info
    mail to: "syssqu@gmail.com"
  end

  def send_inquiry(info)
    @info = info
    mail to: "syssqu@gmail.com"
  end

end
