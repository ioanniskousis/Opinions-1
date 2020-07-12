module UsersHelper
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
    tag.div(class: 'main-menu') do
      buttons.join.html_safe
    end
  end
  
  def user_image(user)
    return user.photo_blob if user.photo_blob

    'guest-128.png'
  end

  def user_coverimage(user)
    return user.cover_blob if user.cover_blob

    'default-cover.jpeg'
  end

  def user_image_link_large(user)
    if user.photo_blob
      tag.div(link_to(user_path(user), class: 'image') do
        image_tag(user.photo_blob, class: 'nav-item-image full_size', alt: '')
      end)
    else
      tag.div(link_to(user_path(user), class: 'image') do
        image_tag('guest-128.png', class: 'nav-item-image half_size', alt: '')
      end)
    end
  end

  def user_followers_count(followers, user)
    rec = followers.filter { |f| f.id == user.id }
    return rec[0].cnt if rec

    0
  end

  def user_followees_count(followees, user)
    rec = followees.filter { |f| f.id == user.id }
    return rec[0].cnt if rec

    0
  end

  def user_opinions_count(opinions, user)
    rec = opinions.filter { |f| f.id == user.id }
    return rec[0].cnt if rec

    0
  end

end
