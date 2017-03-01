class Tribe < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :about, presence: true

  has_many :tribe_members, dependent: :destroy
  has_many :users, through: :tribe_members

  has_attachment :photo
end
