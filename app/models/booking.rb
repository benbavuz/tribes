class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hut
  belongs_to :availability
end
