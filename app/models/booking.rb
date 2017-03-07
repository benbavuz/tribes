class Booking < ApplicationRecord
  belongs_to :availabilitie
  belongs_to :hut
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :availabilitie
end
