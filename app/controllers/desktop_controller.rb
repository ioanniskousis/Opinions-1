class DesktopController < ApplicationController
  before_action :require_login

  def desktop
    @opinion = Opinion.new
    @opinions = Opinion.all
    
  end

end