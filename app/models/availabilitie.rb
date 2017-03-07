class Availabilitie < ApplicationRecord
  belongs_to :hut

  has_many :bookings
end
