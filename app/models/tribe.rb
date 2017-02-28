class Tribe < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :tribe_members, dependent: :destroy
  has_many :users, through: :tribe_members
end
