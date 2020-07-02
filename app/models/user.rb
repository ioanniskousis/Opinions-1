class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :coverimage

  has_many :followings, foreign_key: 'followed_id', dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follower_id',  dependent: :destroy

  has_many :followers, class_name: 'User', through: :followings, foreign_key: 'follower_id'
  has_many :followed, class_name: 'User', through: :inverse_followings, foreign_key: 'followed_id'

  validates :username, presence: true
  validates :fullname, presence: true
  
  scope :to_follow, ->(user) { where('id NOT IN (?)', (user.followed.pluck(:followed_id) << 0)).filter{ |f| f.id != user.id } }
  # scope :to_follow, ->(user) { where('id NOT IN (?)', user.followed_or_zero) }
  
  # def followed_or_zero
  #   followed.pluck(:followed_id) << 0
  #   # f
  #   # return f unless f.nil?
  #   # [0]
  # end

  # def to_follow
  #   f = User.find_by_sql("SELECT * FROM users 
  #                         LEFT JOIN followings
  #                         ON users.id = followings.followed_id
  #                         WHERE followings.id IS NULL")
  # end
end
