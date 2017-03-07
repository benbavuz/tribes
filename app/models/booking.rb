class Booking < ApplicationRecord
  belongs_to :availabilitie
  belongs_to :hut
  belongs_to :user
end
