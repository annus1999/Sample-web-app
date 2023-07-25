class Repository < ApplicationRecord
  validates :name, presence: true

  has_many :repository_users
  has_many :users, through: :repository_users
end
