class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

    def require_authentication!
      redirect_to login_path unless current_user 
    end

    def set_user!(user)
      session[:user_id] = user.id
    end

    def logout_user!
      session.delete :user_id
    end
end
