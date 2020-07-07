class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :coverimage

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followings, foreign_key: 'followed_id', dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy

  has_many :followers, class_name: 'User', through: :followings, foreign_key: 'follower_id'
  has_many :followed, class_name: 'User', through: :inverse_followings, foreign_key: 'followed_id'

  validates :username, presence: true
  validates :fullname, presence: true

  scope :to_follow, ->(user) { where('id NOT IN (?)', user_followed(user)).filter { |f| f.id != user.id } }

  def follow_user(user)
    followed.push(user)
  end

  def unfollow_user(user)
    followed.delete(user)
  end

  def likes_opinion(opinion)
    l = Like.new(user_id: id, opinion_id: opinion)
    l.save
  end

  def unlikes_opinion(opinion)
    like = Like.find_by(user_id: id, opinion_id: opinion)
    like&.destroy unless like.nil?
  end

  def self.user_followed(user)
    user.followed.pluck(:followed_id) << 0
  end

  def self.sort_by_friendly
    User.find_by_sql("SELECT users.id, users.username, users.fullname,
                              count(flds.id) fd
                      FROM users
                      LEFT JOIN followings flds ON users.id = flds.follower_id
                      GROUP BY users.id, users.username, users.fullname
                      ORDER BY fd DESC")
  end

  def self.sort_by_popular
    User.find_by_sql("SELECT users.id, users.username, users.fullname,
                              count(flrs.id) fr
                      FROM users
                      LEFT JOIN followings flrs ON users.id = flrs.followed_id
                      GROUP BY users.id, users.username, users.fullname
                      ORDER BY fr DESC")
  end

  def self.protagonists
    User.find_by_sql("SELECT users.id, users.username, users.fullname,
                              count(opinions.id) opinions_count
                      FROM users
                      LEFT JOIN opinions ON users.id = opinions.author_id
                      GROUP BY users.id, users.username, users.fullname
                      ORDER BY opinions_count DESC")
  end
end
