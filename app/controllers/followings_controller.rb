class FollowingsController < ApplicationController
  before_action :require_login

  def create
    flash.notice = params
    @followed = User.find(params[:user])
    @current_user = User.find(session[:user_id])

    @following = @current_user.followed.push(@followed)

    case params[:direction]
    when 'root'
      redirect_to root_path
    when 'users'
      redirect_to users_path(view: params[:view])
    when 'user'
      redirect_to user_path(params[:view_user], view: params[:view])
    end
  end

  def destroy
    following = Following.find_by(followed_id: params[:id], follower_id: session[:user_id])
    user_id = following.followed_id

    following.destroy if following

    redirect_to user_path(user_id, view: 'details')
  end
end
