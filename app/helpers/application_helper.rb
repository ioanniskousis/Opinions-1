module ApplicationHelper
  def following_arrow(user)
    image_tag('follower.png', alt: '') if @current_user_followees.include?(user.id)
  end

  def follower_arrow(user)
    image_tag('follow.png', alt: '') if @current_user_followers.include?(user.id)
  end
end
