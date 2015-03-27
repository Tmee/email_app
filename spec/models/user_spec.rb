require 'rails_helper'

RSpec.describe User, type: :model do
  it "send an email to another user" do
    user = User.create(name: 'tim', email: 'example2@exmaple.com', password: 'password')
    puts "#{user.name} ::::: #{user.email}"
    user.send_email("tjmee90@gmail.com", "This is a testing thing", "and the body goes here")
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include 'tjmee90@gmail.com'
    expect(result.from).to include 'example@example.com'
    expect(result.subject).to eq 'This is a testing thing'
  end
end
