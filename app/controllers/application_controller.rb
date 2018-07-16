class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    if current_user==nil
      redirect_to root_path
    end
  end

end