module NavHelper

  def draw_nav_bar
    render 'layouts/nav'
  end

  def link_to_profile
    if @current_user
      label = @current_user.username
      path = user_path(@current_user)
      img = (@current_user.photo.attached? ? @current_user.photo : "guest-128-w.png")
      nav_class =  'nav-profile'
      tag.div(class: nav_class) do
        [image_tag(img, alt: "", width:"40", height: "40"),
        link_to(label, path)].join.html_safe
      end
    end
  end

  def link_to_current_user
    if @current_user
      label = 'profile' 
      path = user_path(@current_user)
      nav_class = (((@direction == 'user' || @direction == 'edit_user') && (@user == @current_user)) ? 
                    'nav-item nav-selected' : 'nav-item')
      image = "guest-w.png"

      tag.div(link_to(path) do
        [ image_tag(image, class: 'nav-item-image', alt: ""),
        tag.label(label, class: 'nav-item-label')].join.html_safe
      end , class: nav_class)
    end
  end

  def link_to_logout
    if @current_user
      label = 'logout'
      path = session_path(0)
      nav_class = 'nav-item'
      image = "logout.png"

      tag.div(link_to(path, method: :delete) do
        [ image_tag(image, class: 'nav-item-image', alt: ""),
        tag.label(label, class: 'nav-item-label')].join.html_safe
      end , class: nav_class)
    end
  end

  def link_to_home
    if @current_user
      label = 'Home'
      path = opinions_path #root_path(direction: 'root')
      nav_class = (@direction == 'root' ? 'nav-item nav-selected' : 'nav-item')
      image = "home.png"

      # tag.div(link_to(label, path), class: nav_class) unless @current_user.nil?
      tag.div(link_to(path) do
        [ image_tag(image, class: 'nav-item-image', alt: ""),
        tag.label(label, class: 'nav-item-label')].join.html_safe
      end , class: nav_class)
    end
  end

  def link_to_users
    if @current_user
      label = 'Users'
      path = users_path # root_path(direction: 'users')
      nav_class = (@direction == 'users' ? 'nav-item nav-selected' : 'nav-item')
      image = "users.png"

      # tag.div(link_to(label, path), class: nav_class) unless @current_user.nil?

      tag.div(link_to(path) do
        [ image_tag(image, class: 'nav-item-image', alt: ""),
        tag.label(label, class: 'nav-item-label')].join.html_safe
      end , class: nav_class)
    end
  end

  def link_to_signin
    unless @current_user
      label = 'Log In'
      path = new_session_path
      nav_class = @direction == 'new_session' ? 'nav-item nav-selected' : 'nav-item'
      image = "login.png"

      # tag.div(link_to(label, path), class: nav_class) if @current_user.nil?
      tag.div(link_to(path) do
        [ image_tag(image, class: 'nav-item-image', alt: ""),
        tag.label(label, class: 'nav-item-label')].join.html_safe
      end , class: nav_class)
    end
  end

  def link_to_signup
    unless @current_user
      label = 'Sign Up'
      path = new_user_path
      nav_class = (@direction == 'new_user' ? 'nav-item nav-selected' : 'nav-item')
      image = "add-user.png"

      tag.div(link_to(path) do
        [ image_tag(image, class: 'nav-item-image', alt: ""),
        tag.label(label, class: 'nav-item-label')].join.html_safe
      end , class: nav_class)
    end
  end

end