class Team < ApplicationRecord
  SPORTS = %w[Football Rugby Netball Hockey Basketball Cricket]
  belongs_to :user
  has_many :games
  has_many :memberships
  has_many :users, through: :memberships
  has_many :reviews, through: :games
end
