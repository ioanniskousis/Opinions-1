class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :coverimage

  has_many :followers, class_name: :user, dependent: :destroy
  has_many :followed, class_name: :user,  dependent: :destroy

  validates :username, presence: true
  validates :fullname, presence: true
  
end
