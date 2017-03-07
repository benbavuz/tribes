class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hut
  belongs_to :availability

  validates_uniqueness_of :user_id, :scope => :availability_id

end
