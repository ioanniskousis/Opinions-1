module ApplicationHelper
  def link_to_unfollow(user)
    cond = @current_user.followed.include?(user) && (@current_user != user)
    path = following_path(user)
    link_to 'Unfollow', path, method: :delete, class: 'g-link m30' if cond
  end

  def link_to_follow(user)
    cond = @current_user.followed.include?(user) || (@current_user == user)
    path = followings_path(user: user, view: @user_view, direction: @direction, view_user: user)
    link_to('Follow', path, method: :post, class: 'g-link m30') unless cond
  end

  def to_follow_button(user)
    if @current_user.followed.include?(user) || (@current_user == user)
      tag.div(class: 'plus half_opacity') do
        tag.div do
          image_tag('plus.png', alt: '', class: 'half_size')
        end
      end
    else
      tag.div(class: 'plus') do
        path = followings_path(user: user, view: @user_view, direction: @direction, view_user: @user)
        link_to(image_tag('plus.png', alt: '', class: 'half_size'), path, method: :post)
      end
    end
  end

  def following_arrow(user)
    image_tag('follower.png', alt: '') if @current_user.followed.include?(user) && (@current_user != user)
  end

  def follower_arrow(user)
    image_tag('follow.png', alt: '') if @current_user.followers.include?(user) && (@current_user != user)
  end

  def draw_header
    render 'layouts/header'
  end
end
