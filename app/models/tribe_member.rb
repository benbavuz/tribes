class TribeMember < ApplicationRecord
  belongs_to :tribe
  belongs_to :user

  validates_uniqueness_of :tribe_id, :scope => :user_id
end
