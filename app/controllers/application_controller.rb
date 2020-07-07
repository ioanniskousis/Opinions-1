class ApplicationController < ActionController::Base
  def require_login
    if session[:user_id]
      true
    else
      redirect_to new_session_path
      false
    end
  end
end
