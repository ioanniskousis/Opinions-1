class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true
end
