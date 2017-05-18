class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to posts_path
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
