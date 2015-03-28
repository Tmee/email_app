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
    UserMailer.send_email(params[:user_name],params[:recipient], params[:subject], params[:body]).deliver_now
    redirect_to user_path(current_user)
  end

  private


  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end