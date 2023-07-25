class Repository < ApplicationRecord
  validates :name, presence: true

  has_many :repository_users
  has_many :users, through: :repository_users

  scope :search_by_name_or_description, ->(query) {
    where("name ILIKE :query OR description ILIKE :query", query: "%#{query}%")
  }
end
