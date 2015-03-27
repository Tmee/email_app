class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      UserMailer.send_email(user).deliver
      redirect_to '/'
    end
  end

  private


  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
