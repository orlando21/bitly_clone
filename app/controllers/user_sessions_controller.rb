class UserSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(urls_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
#    redirect_to(:users, notice: 'Logged out!')
    redirect_to(:urls, notice: 'Logged out!')
  end

end
