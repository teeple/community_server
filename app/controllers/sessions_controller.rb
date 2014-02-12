class SessionsController < ApplicationController
  
  def new
  end

  def create
    #user = User.find_by(imsi: params[:session][:imsi], ecgi: params[:session][:ecgi])
    user = User.find_by(imsi: params[:imsi], ecgi: params[:ecgi])
    if user
      sign_in user
      render 'new'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
