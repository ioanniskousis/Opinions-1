class Opinion < ApplicationRecord
  validates :text, presence: true
end
