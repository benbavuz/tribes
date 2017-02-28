class Hut < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :capacity, presence: true

  has_many :hut_equipments
  has_many :equipments, through: :hut_equipments
end
