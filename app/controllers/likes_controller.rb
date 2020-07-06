class LikesController < ApplicationController
  before_action :require_login

  def create
    # opinion = Opinion.find(params[:opinion])
    # l = Like.create(user_id: session[:user_id], opinion_id: params[:opinion])
    l = Like.new(user_id: session[:user_id], opinion_id: params[:format])
    l.save
    flash.notice = params

    case params[:direction]
    when 'root'
      redirect_to root_path
    when 'user'
      redirect_to user_path(params[:view_user], view: 'opinions')
    end
  end

  def destroy
    flash.notice = params

    like = Like.find_by("opinion_id = #{params[:id]} AND user_id = #{session[:user_id]}").destroy

    case params[:direction]
    when 'root'
      redirect_to root_path
    when 'user'
      redirect_to user_path(params[:view_user], view: 'opinions')
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :opinion_id)
  end
end
