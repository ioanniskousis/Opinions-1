module UsersHelper
  def user_image(user)
    if user.photo.attached?
      image_tag(user.photo, alt: "", width: "60")
    else
      image_tag("guest-128.png", alt: "", width: "40", height: "40")
    end
  end

  def user_photo(user)
    if user.photo.attached?
      user.photo
    else
      "guest-128.png"
    end
  end

  def user_coverimage(user)
    if user.coverimage.attached?
      user.coverimage
    else
      "default-cover.jpeg"
    end
  end

  def user_image_link_large(user)
    if user.photo.attached?
      tag.div(link_to(user_path(user), class: 'image') do
        image_tag(user.photo, class: 'nav-item-image', alt: "", class: 'full_size')
      end)
    else
      tag.div(link_to(user_path(user), class: 'image') do
        image_tag("guest-128.png", class: 'nav-item-image', alt: "", class: 'half_size')
      end)
    end
  end

  def user_image_link_xlarge(user)
    if user.photo.attached?
      image_tag(user.photo, alt: "", class: 'full_size')
    else
      image_tag("guest-128.png", alt: "", class: 'half_size')
    end
  end

  def draw_user_page
    case @user_view
    when 'opinions'
      render 'opinions'
    when 'following'
      render 'following'
    when 'followers'
      render 'followers'
    else
      render 'details'
    end
  end

  def draw_user_main_menu
    details_class = @user_view == 'details' ? 'main-menu-item selected' : 'main-menu-item'
    opinions_class = @user_view == 'opinions' ? 'main-menu-item selected' : 'main-menu-item'
    following_class = @user_view == 'following' ? 'main-menu-item selected' : 'main-menu-item'
    followers_class = @user_view == 'followers' ? 'main-menu-item selected' : 'main-menu-item flr'

    buttons = []
    buttons << tag.div(link_to('details', user_path(@user, view: 'details')), class: details_class)
    buttons << tag.div(link_to('opinions', user_path(@user, view: 'opinions')), class: opinions_class)
    buttons << tag.div(link_to('following', user_path(@user, view: 'following')), class: following_class)
    buttons << tag.div(link_to('followers', user_path(@user, view: 'followers')), class: followers_class)

    tag.div(class: "main-menu") do
      buttons.join.html_safe
    end
  end

  def draw_users_main_menu
    all_class = @user_view == 'all' ? 'main-menu-item selected' : 'main-menu-item'
    friendly_class = @user_view == 'friendly' ? 'main-menu-item selected' : 'main-menu-item'
    popular_class = @user_view == 'popular' ? 'main-menu-item selected' : 'main-menu-item'
    protagonists_class = @user_view == 'protagonists' ? 'main-menu-item selected' : 'main-menu-item'

    buttons = []
    buttons << tag.div(link_to('all', users_path(view: 'all')), class: all_class)
    buttons << tag.div(link_to('most friendly', users_path(view: 'friendly')), class: friendly_class)
    buttons << tag.div(link_to('most popular', users_path(view: 'popular')), class: popular_class)
    buttons << tag.div(link_to('protagonists', users_path(view: 'protagonists')), class: protagonists_class)

    tag.div(class: "main-menu") do
      buttons.join.html_safe
    end
  end

  def to_follow_button(user)
    unless (@current_user.followed.include?(user)) || (@current_user == user)
      tag.div(class: "plus") do
        link_to(image_tag("plus.png", alt: "", class: 'half_size'), followings_path(user: user, view: @user_view, direction: @direction, view_user: @user), method: :post)
      end
    else
      tag.div(class: "plus half_opacity") do
        tag.div() do
          image_tag("plus.png", alt: "", class: 'half_size')
        end
      end
    end
  end

  def draw_user
    render 'users/show' if @direction == 'user'
  end

  def draw_edit_user
    render 'users/edit' if @direction == 'edit_user'
  end

  def draw_users
    render 'users/index' if @direction == 'users'
  end

  def draw_new_user
    render 'users/new' if @direction == 'new_user'
  end

  def photo_filename(user)
    return (user.photo.blob.filename.base + '.' + user.photo.filename.extension) if user.photo.attached?

    nil
  end

  def coverimage_filename(user)
    return (user.coverimage.blob.filename.base + '.' + user.coverimage.filename.extension) if user.coverimage.attached?

    nil
  end

  def draw_form
    if @user == @current_user
      render 'opinions/form'
    end
  end

  def link_to_edit_user
    if @user == @current_user
      link_to('Edit', edit_user_path(@user), class: 'g-link m30')
    end
  end

  def link_to_unfollow(user)
    if (@current_user.followed.include?(user)) && (@current_user != user)
      link_to 'Unfollow', following_path(user), method: :delete, class: 'g-link m30'
    end
  end

  def link_to_follow(user)
    unless (@current_user.followed.include?(user)) || (@current_user == user)
      link_to('Follow', followings_path(user: user, view: @user_view, direction: @direction, view_user: user), method: :post, class: 'g-link m30')
    end
  end

  def following_arrow(user)
    if (@current_user.followed.include?(user)) && (@current_user != user)
      image_tag('follow.png', alt: '')
    end
  end
end
