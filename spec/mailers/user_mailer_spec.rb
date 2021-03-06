require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
   it 'sends an email to another email address' do
    UserMailer.send_email("Tim", "simple@example.com", "This is a testing thing", "and the body goes here").deliver_now
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include 'simple@example.com'
    expect(result.from).to include 'EmailSerice@emailer.com'
    expect(result.subject).to eq 'This is a testing thing'
  end

  it 'sends an email when an user is created' do
    user = User.create(name: 'Mike', email: 'simple@example.com', password: 'password')
    UserMailer.created_email(user).deliver_now
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include 'simple@example.com'
    expect(result.from).to include 'EmailSerice@emailer.com'
    expect(result.subject).to eq 'EmailService'
  end
end