class UserMailer < ApplicationMailer
  default :from => "EmailSerice@emailer.com"

  def send_email(sender, recipient, subject, body)
    @body   = body
    @sender = sender
    mail( :to => recipient,
    :subject => subject)
  end

  def created_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => "EmailService")
  end

end