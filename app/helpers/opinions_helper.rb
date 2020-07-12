module OpinionsHelper
  def draw_opinions_main_menu
    tag.div(class: 'main-menu') do
      [tag.div(link_to('opinions', root_path(direction: 'root')), class: 'main-menu-item selected')]
        .join.html_safe
    end
  end

  def draw_form
    render 'opinions/form' if @user == @current_user
  end

  def like_button(opinion)
    likes = @likes.filter { |l| l.opinion_id == opinion.id }
    ilike = likes.map(&:user_id).include?(session[:user_id])
    # ilike = opinion.likes.map(&:user_id).include?(session[:user_id])

    button = ilike ? image_tag('heart-r.png') : image_tag('heart.png')
    if ilike
      path = like_path(opinion.id, direction: @direction, view_user: @user, anchor: 'opinion' + opinion.id.to_s)
      tag.div(class: 'like-div') do
        [tag.span(likes.count, class: 'like-span'), link_to(button, path, method: :delete)].join.html_safe
      end
    else
      path = likes_path(opinion.id, direction: @direction, view_user: @user, anchor: 'opinion' + opinion.id.to_s)
      tag.div(class: 'like-div') do
        [tag.span(likes.count, class: 'like-span'), link_to(button, path, method: :post)].join.html_safe
      end
    end
    # if ilike
    #   path = like_path(opinion.id, direction: @direction, view_user: @user, anchor: 'opinion' + opinion.id.to_s)
    #   tag.div(class: 'like-div') do
    #     [tag.span(opinion.likes.count, class: 'like-span'), link_to(button, path, method: :delete)].join.html_safe
    #   end
    # else
    #   path = likes_path(opinion.id, direction: @direction, view_user: @user, anchor: 'opinion' + opinion.id.to_s)
    #   tag.div(class: 'like-div') do
    #     [tag.span(opinion.likes.count, class: 'like-span'), link_to(button, path, method: :post)].join.html_safe
    #   end
    # end
  end
end
