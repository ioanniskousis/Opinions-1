class DesktopController < ApplicationController
  before_action :require_login

  def desktop
    # flash[:notice] = params

    @direction = params[:direction]

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @direction = 'new_session' if @direction.nil?
    end

    case @direction
    when 'user'
      prepare_user
    when 'edit_user'
      prepare_edit_user 
    when 'new_user'
      prepare_new_user
    when 'users'
      prepare_users
    when 'new_session'
      prepare_new_session
    else
      @direction = 'root'
      prepare_default
    end


  end

  private 
  def prepare_default
    @opinion = Opinion.new
    @opinions = Opinion.all.ordered_by_most_recent
    @to_follow = User.to_follow(@current_user)

  end

  def prepare_user
    @user = User.find(params[:user])
    @opinion = Opinion.new
    @opinions = @user.opinions.all.ordered_by_most_recent
  end

  def prepare_edit_user
    @user = User.find(params[:user])
  end

  def prepare_users
    @users = User.all
  end
  
  def prepare_new_user
    @user = User.new
  end

  def prepare_new_session;  end

end