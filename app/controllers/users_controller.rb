class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.created_email(@user).deliver_now
      redirect_to user_path(@user)
    end
  end

  def show
    @user = current_user
  end

  def send_email
    current_user.send_email(recipient, subject, body)
    redirect_to user_path(current_user)
  end

  private


  def recipient
    params[:recipient_email]
  end

  def subject
    params[:subject]
  end

  def body
    params[:body]
  end

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end