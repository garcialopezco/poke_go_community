class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
      set_user!(user)
      redirect_to root_path, notice: t('login.successful_login', trainer: user.name)
    else
      flash[:notice] = t('login.invalid_credentials')
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to root_path, notice: t('logout.message')
  end
end
