class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  has_many :teams
  has_many :games, through: :teams
  has_many :requested_bookings, through: :games, source: :bookings
  has_many :bookings
  has_many :memberships
  has_many :joined_teams, through: :memberships, source: :teams
  has_many :reviews

  geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

end
