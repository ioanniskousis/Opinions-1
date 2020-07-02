module UsersHelper
  def photo_filename(user)
    return (user.photo.blob.filename.base + '.' + user.photo.filename.extension) if user.photo.attached?
    nil
  end
  def coverimage_filename(user)
    return (user.coverimage.blob.filename.base + '.' + user.coverimage.filename.extension) if user.coverimage.attached?
    nil
  end
end
