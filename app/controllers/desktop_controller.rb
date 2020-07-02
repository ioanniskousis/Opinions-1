class DesktopController < ApplicationController
  before_action :require_login

  def desktop
    @current_user = User.find(session[:user_id])
    @opinion = Opinion.new
    @opinions = Opinion.all.ordered_by_most_recent
    @to_follow = User.to_follow(@current_user)


  end

end