class SessionsController < ApplicationController
  def new
    @direction = 'new_session'
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      ApplicationController.cash_session_user_id_for_testing(@user.id) if Rails.env.test?

      session[:user_id] = @user.id
      @current_user = User.find(session[:user_id])

      redirect_to opinions_path
    else
      flash.alert = "'" + params[:username] + "' : is a Wrong User Name !!"

      redirect_to new_session_path
    end
  end

  def destroy
    ApplicationController.cash_session_user_id_for_testing(nil) if Rails.env.test?

    session[:user_id] = nil
    redirect_to new_session_path
  end
end
