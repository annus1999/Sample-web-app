class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :repository_users
  has_many :repositories, through: :repository_users
end
