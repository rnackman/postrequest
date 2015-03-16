class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
      login(@user)
      redirect_to root_path
    else
      render :new 
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end