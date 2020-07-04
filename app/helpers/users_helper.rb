module UsersHelper
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
end
