class Like < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  def self.user_likes_opinion(user, opinion)
    l = Like.new(user_id: user, opinion_id: opinion)
    l.save
  end

  def self.user_unlikes_opinion(user, opinion)
    like = self.find_by(user_id: user, opinion_id: opinion)
    like.destroy if like
  end
end
