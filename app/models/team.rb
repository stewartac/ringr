class Team < ApplicationRecord
  belongs_to :user
  has_many :games
  has_many :memberships
  has_many :reviews, through: :games
end
