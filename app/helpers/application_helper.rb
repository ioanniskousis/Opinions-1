module ApplicationHelper
  def draw_main_menu
    # <div class="main-menu">
    #   <div class="main-menu-item">
    #     <%= link_to('tweets', root_path(direction: 'root')) %>
    #   </div>
    # </div>
    # tag.div( 
    #   do
    #   tag.div(link_to('tweets', root_path(direction: 'root')), class: "main-menu-item")
    #   end,
    #   class: "main-menu")

        tag.div(class: "main-menu") do
          [tag.div(link_to('tweets', root_path(direction: 'root')), class: "main-menu-item selected"),
          tag.div(link_to('photos', root_path(direction: 'root')), class: "main-menu-item")
        ].join.html_safe
        end
  end

  def draw_opinions_main_menu
    tag.div(class: "main-menu") do
      [tag.div(link_to('opinions', root_path(direction: 'root')), class: "main-menu-item selected"),
      tag.div(link_to('debate', root_path(direction: 'root')), class: "main-menu-item")
    ].join.html_safe
    end
  end

end
