class RegistrationsController < ApplicationController
  before_action :set_user
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to projects_path, notice: 'You have signed up successfully.'
    else
      render 'new'
    end
  end
  
  def show
  end
  
  private
  
  def set_user
    @user = User.new
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end