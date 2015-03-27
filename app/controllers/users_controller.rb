class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      UserMailer.created_email(user).deliver
      redirect_to users_path(user.id)
    end
  end

  def show
    @user = current_user
  end

  def send_email
    binding.pry
    UserMailer.send_email(params[:user_name],params[:recipient], params[:subject], params[:body])
    redirect_to users_path(current_user.id)
  end

  private


  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
