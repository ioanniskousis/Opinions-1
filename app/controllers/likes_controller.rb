class LikesController < ApplicationController
  before_action :require_login

  def create
    flash.notice = params

    redirect_to root_path
    # @followed = User.find(params[:user])
    # @current_user = User.find(session[:user_id])

    # @following = @current_user.followed.push(@followed)

    # case params[:direction]
    # when 'root'
    #   redirect_to root_path
    # when 'users'
    #   redirect_to users_path(view: params[:view])
    # when 'user'
    #   redirect_to user_path(params[:view_user], view: params[:view])
    # end

  end

  def destroy

  end

  private

  def like_params
    params.require(:like).permit(:user_id, :opinion_id)
  end

end