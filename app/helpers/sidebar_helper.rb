module SidebarHelper

  def draw_to_follow
    render 'followings/to_follow' if @direction == 'root'
  end

end