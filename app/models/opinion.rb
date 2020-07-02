class Opinion < ApplicationRecord
  validates :text, presence: true
  validates :author_id, presence: true
end
