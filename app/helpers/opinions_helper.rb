module OpinionsHelper
  
  def draw_opinions_main_menu
    tag.div(class: "main-menu") do
      [tag.div(link_to('opinions', root_path(direction: 'root')), class: "main-menu-item selected"),
      tag.div(link_to('debate', root_path(direction: 'root')), class: "main-menu-item")
    ].join.html_safe
    end
  end



end
