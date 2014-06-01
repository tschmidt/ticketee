class SessionsController < ApplicationController
  def new
  end
  
  def create
    arel_user = User.arel_table
    user = User.where(
      arel_user[:name].eq(params[:session][:name]).or(
      arel_user[:email].eq(params[:session][:name])
    )).first
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Signed in successfully.'
    else
      flash[:error] = "Username or password is incorrect."
      render :new
    end
  end
end