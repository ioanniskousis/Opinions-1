class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true


  asat = 'ActiveStorage::Attachment'
  has_one_attached :photo
  pho = 'photo'
  has_one :user_photo, -> { where(name: pho) }, class_name: asat, as: :record, inverse_of: :record, dependent: false
  has_one :photo_blob, through: :user_photo, class_name: 'ActiveStorage::Blob', source: :blob

  has_one_attached :coverimage
  cim = 'coverimage'
  has_one :user_cover, -> { where(name: cim) }, class_name: asat, as: :record, inverse_of: :record, dependent: false
  has_one :cover_blob, through: :user_cover, class_name: 'ActiveStorage::Blob', source: :blob

end
