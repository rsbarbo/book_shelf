class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = "Invalid Password, please try again"
      render :new
    end
  end

end
