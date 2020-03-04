class Game < ApplicationRecord
  searchkick

  #    include PgSearch::Model
  # pg_search_scope :search_by_address,
  #   against: [:address],
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  belongs_to :team
  has_many :bookings
  has_many :reviews

end
