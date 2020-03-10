class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :team
  validates :user, uniqueness: { scope: :team,
    message: "you can't join this team more than once" }
end
