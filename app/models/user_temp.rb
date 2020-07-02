class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :coverimage
end
