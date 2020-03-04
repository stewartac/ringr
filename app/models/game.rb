class Game < ApplicationRecord
  searchkick
  belongs_to :team
  has_many :bookings
  has_many :reviews

end
