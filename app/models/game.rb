class Game < ApplicationRecord
  searchkick
  belongs_to :team
  has_many :bookings, dependent: :destroy
  has_many :reviews


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
