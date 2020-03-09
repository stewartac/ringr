class Game < ApplicationRecord
  SPORTS = %w[Football Rugby Netball Hockey Basketball Cricket]
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :team
  has_many :bookings, dependent: :destroy
  has_many :reviews


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
