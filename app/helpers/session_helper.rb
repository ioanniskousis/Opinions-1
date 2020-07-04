module SessionHelper
  def draw_new_session
    render 'sessions/new' if @direction == 'new_session'
  end
end