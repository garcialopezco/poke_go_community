class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        set_user!(@user)
        format.html { redirect_to root_path, notice: t('sign_up.welcome', trainer: @user.name) }
      else
        format.html { render :new }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :level,
                                   :trainer_phone_number,
                                   :password,
                                   :password_confirmation)
    end
end
