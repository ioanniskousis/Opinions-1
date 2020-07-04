class User < ApplicationRecord
  @@u_follow = nil

  has_one_attached :photo
  has_one_attached :coverimage

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followings, foreign_key: 'followed_id', dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follower_id',  dependent: :destroy

  has_many :followers, class_name: 'User', through: :followings, foreign_key: 'follower_id'
  has_many :followed, class_name: 'User', through: :inverse_followings, foreign_key: 'followed_id'

  validates :username, presence: true
  validates :fullname, presence: true
  
  scope :to_follow, ->(user) { where('id NOT IN (?)', self.user_followed(user) ).filter{ |f| f.id != user.id } }
  # scope :to_follow, ->(user) { where('id NOT IN (?)', (user.followed.pluck(:followed_id) << 0)).filter{ |f| f.id != user.id } }

  def self.user_followed(u)
    return @@u_follow unless @@u_follow.nil?
    @@u_follow = u.followed.pluck(:followed_id) << 0
    @@u_follow
  end
end
