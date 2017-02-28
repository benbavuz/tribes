class Hut < ApplicationRecord
  belongs_to :user

  has_many :hut_equipments
  has_many :equipments, through: :hut_equipments
end
