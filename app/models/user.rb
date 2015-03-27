class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password

  def send_email(recipient, subject, body)
    UserMailer.send_email(name, recipient, subject, body)
  end
end