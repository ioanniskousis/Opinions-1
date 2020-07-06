module NavHelper
  def draw_nav_bar
    render 'layouts/nav'
  end

  def draw_currentuserinfo
    render('layouts/currentuserinfo') if @current_user
  end

  def link_to_current_user
    if @current_user
      label = 'profile'
      path = user_path(@current_user)
      nav_class = (((@direction == 'user' || @direction == 'edit_user') && (@user == @current_user)) ?
                    'nav-item nav-selected' : 'nav-item')
      image = "guest-w.png"

      tag.div(link_to(path) do
        [image_tag(image, class: 'nav-item-image', alt: ""),
         tag.label(label, class: 'nav-item-label')].join.html_safe
      end, class: nav_class)
    end
  end

  def link_to_logout
    if @current_user
      label = 'logout'
      path = session_path(0)
      nav_class = 'nav-item'
      image = "logout.png"

      tag.div(link_to(path, method: :delete) do
        [image_tag(image, class: 'nav-item-image', alt: ""),
         tag.label(label, class: 'nav-item-label')].join.html_safe
      end, class: nav_class)
    end
  end

  def link_to_home
    if @current_user
      label = 'Home'
      path = opinions_path
      nav_class = (@direction == 'root' ? 'nav-item nav-selected' : 'nav-item')
      image = "home.png"

      tag.div(link_to(path) do
        [image_tag(image, class: 'nav-item-image', alt: ""),
         tag.label(label, class: 'nav-item-label')].join.html_safe
      end, class: nav_class)
    end
  end

  def link_to_users
    if @current_user
      label = 'Users'
      path = users_path
      nav_class = (@direction == 'users' ? 'nav-item nav-selected' : 'nav-item')
      image = "users.png"

      tag.div(link_to(path) do
        [image_tag(image, class: 'nav-item-image', alt: ""),
         tag.label(label, class: 'nav-item-label')].join.html_safe
      end, class: nav_class)
    end
  end

  def link_to_signin
    unless @current_user
      label = 'Log In'
      path = new_session_path
      nav_class = @direction == 'new_session' ? 'nav-item nav-selected' : 'nav-item'
      image = "login.png"

      tag.div(link_to(path) do
        [image_tag(image, class: 'nav-item-image', alt: ""),
         tag.label(label, class: 'nav-item-label')].join.html_safe
      end, class: nav_class)
    end
  end

  def link_to_signup
    unless @current_user
      label = 'Sign Up'
      path = new_user_path
      nav_class = (@direction == 'new_user' ? 'nav-item nav-selected' : 'nav-item')
      image = "add-user.png"

      tag.div(link_to(path) do
        [image_tag(image, class: 'nav-item-image', alt: ""),
         tag.label(label, class: 'nav-item-label')].join.html_safe
      end, class: nav_class)
    end
  end
end
