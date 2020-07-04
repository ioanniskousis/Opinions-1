

module OpinionsHelper
  # include Rails.application.routes.url_helpers

  # require 'image_size'
  # require 'fastimage'

  def user_image(user)
    # img = (user.photo.attached? ? user.photo : "guest-128-w.png")
    if user.photo.attached?
      # image_path = ActiveStorage::Blob.service.path_for(user.photo.key)
# puts 'image_path ***** = ' +  image_path

      img = user.photo
      # image_size = ImageSize.path(image_path)
      # if image_size.width > image_size.height
        # image_tag(img, alt: "", height: "60")
      # else
        image_tag(img, alt: "", width:"60")
      # end
    else
      image_tag("guest-128.png", alt: "", width:"40", height: "40")
    end
  end

  def draw_new_opinion
    render 'opinions/form' if (@direction == 'root' || @direction.nil?)
    
  end
  def draw_opinions
    render 'opinions/index' if (@direction == 'root' || @direction == 'user' || @direction.nil?)
    
  end
end
