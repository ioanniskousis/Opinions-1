class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :text, presence: true
  validates :author_id, presence: true

  has_many :likes, dependent: :destroy
  has_many :likers, class_name: "User", through: :likes, source: 'user'

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  # scope :ordered_by_most_popular, -> { order('? :desc', self.opinion_likes(opinion)) }

  # def self.opinion_likes(opinion)
  #   opinion.likes.count
  # end
end
