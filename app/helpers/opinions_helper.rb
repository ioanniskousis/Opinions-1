module OpinionsHelper
  def draw_opinions_main_menu
    tag.div(class: "main-menu") do
      [tag.div(link_to('opinions', root_path(direction: 'root')), class: "main-menu-item selected")]
        .join.html_safe
    end
  end

  def like_button(opinion)
    ilike = opinion.likes.map { |l| l.user_id }.include?(session[:user_id])
    button = ilike ? image_tag('heart-r.png') : image_tag('heart.png')
    # link_to(button, likes_path(opinion: opinion.id, direction: @direction, view_user: @user), method: :post)
    # link_to(button, like_path(opinion.id, direction: @direction, view_user: @user), method: :delete)
    if ilike
      tag.div(class: 'like-div') do
        [tag.span(opinion.likes.count, class: 'like-span'),
         link_to(button, like_path(opinion.id, direction: @direction, view_user: @user), method: :delete)].join.html_safe
      end
    else
      tag.div(class: 'like-div') do
        [tag.span(opinion.likes.count, class: 'like-span'),
         link_to(button, likes_path(opinion.id, direction: @direction, view_user: @user), method: :post)].join.html_safe
      end
    end
  end
end
