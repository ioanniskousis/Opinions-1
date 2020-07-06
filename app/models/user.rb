class User < ApplicationRecord
  @@u_follow = nil

  has_one_attached :photo
  has_one_attached :coverimage

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :followings, foreign_key: 'followed_id', dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy

  has_many :followers, class_name: 'User', through: :followings, foreign_key: 'follower_id'
  has_many :followed, class_name: 'User', through: :inverse_followings, foreign_key: 'followed_id'

  # has_many :likes, dependent: :destroy

  validates :username, presence: true
  validates :fullname, presence: true

  scope :to_follow, ->(user) { where('id NOT IN (?)', self.user_followed(user)).filter { |f| f.id != user.id } }

  # scope :to_follow, ->(user) { where('id NOT IN (?)', (user.followed.pluck(:followed_id) << 0)).filter{ |f| f.id != user.id } }

  # scope :ordered_by_most_friendly, -> { order(followed.count :desc) }
  # scope :ordered_by_most_popular, -> { order(followers.count :desc) }

  def self.user_followed(user)
    # return @@u_follow unless @@u_follow.nil?
    @@u_follow = user.followed.pluck(:followed_id) << 0
    # @@u_follow
  end

  def self.users_with_info
    User.find_by_sql("SELECT users.id,
                             users.username,
                             users.fullname,
                             blobs.filename AS photo,
                             blobs.key AS photo_key
                      FROM users
                      LEFT JOIN active_storage_attachments ON users.id = active_storage_attachments.record_id
                      JOIN active_storage_blobs blobs ON active_storage_attachments.blob_id = blobs.id


    ")
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
