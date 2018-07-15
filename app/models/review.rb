class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :likes
  has_many :likers, through: :likes, source: :user

  validates :rating, 
    presence: true,
    inclusion: 1..5
end
