class LikesController < ApplicationController
  before_action :require_login

  def create
    Like.user_likes_opinion(session[:user_id], params[:format])

    case params[:direction]
    when 'root'
      redirect_to root_path(anchor: params[:anchor])
    when 'user'
      redirect_to user_path(params[:view_user], view: 'opinions', anchor: params[:anchor])
    end
  end

  def destroy
    Like.user_unlikes_opinion(session[:user_id], params[:id])

    case params[:direction]
    when 'root'
      redirect_to root_path(anchor: params[:anchor])
    when 'user'
      redirect_to user_path(params[:view_user], view: 'opinions', anchor: params[:anchor])
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :opinion_id)
  end
end
