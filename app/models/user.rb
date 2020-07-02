class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :coverimage

  has_many :followings, foreign_key: 'followed_id'
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followers, class_name: 'User', through: :followings, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'User', through: :inverse_followings, foreign_key: 'followed_id',  dependent: :destroy

  validates :username, presence: true
  validates :fullname, presence: true
  
end
